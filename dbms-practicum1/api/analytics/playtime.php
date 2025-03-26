<?php

require_once __DIR__ . '/../../config/db.php';

header("Content-type: application/json; charset=utf-8");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");

$method = $_SERVER["REQUEST_METHOD"];
$path = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
$segments = explode("/", trim($path, "/"));
$input = file_get_contents("php://input");

try {
    switch ($method) {
        case "GET":
            $type = $_GET["type"];
            if (!isset($type)) {
                http_response_code(400);
                echo json_encode(["status" => "error", 'message' => 'The type query string must be either average or total']);
                return;
            }
            if ($type == "total") {
                $id = $segments[4];
                getPlayTimePerWeekGroupByPlayer($conn, $id);
            } else if ($type == "average") {
                getAveragePlayTimePerPlayer($conn);
            }
            break;
        default:
            http_response_code(405);
            echo json_encode(["status" => "error", 'message' => 'Method not allowed']);
            break;
    }
} catch (Exception $e) {
    http_response_code($e->getCode());
    echo $e->getMessage();
}

function getPlayTimePerWeekGroupByPlayer($conn, $id = null)
{
    // Check for optional start date from query string
    $startDate = isset($_GET['start']) ? $_GET['start'] : null;

    $whereClauses = [];
    if ($id !== null) {
        $whereClauses[] = "p.id = " . intval($id);
    }

    if ($startDate !== null) {
        $whereClauses[] = "s.startedAt >= '" . $conn->real_escape_string($startDate) . "'";
    }

    $whereSQL = count($whereClauses) > 0 ? "WHERE " . implode(" AND ", $whereClauses) : "";

    $sql = "
        SELECT 
            p.id AS player_id,
            DATE(DATE_SUB(s.startedAt, INTERVAL WEEKDAY(s.startedAt) DAY)) AS week_start,
            DATE(DATE_ADD(DATE_SUB(s.startedAt, INTERVAL WEEKDAY(s.startedAt) DAY), INTERVAL 6 DAY)) AS week_end,
            CONCAT(
                DATE(DATE_SUB(s.startedAt, INTERVAL WEEKDAY(s.startedAt) DAY)),
                ' to ',
                DATE(DATE_ADD(DATE_SUB(s.startedAt, INTERVAL WEEKDAY(s.startedAt) DAY), INTERVAL 6 DAY))
            ) AS week_range,
            SUM(TIMESTAMPDIFF(MINUTE, s.startedAt, s.endedAt)) AS duration
        FROM session s
        JOIN player p ON p.id = s.playerId
        $whereSQL
        GROUP BY p.id, week_start
        ORDER BY p.id, week_start;
    ";

    $result = $conn->query($sql);

    if (!$result) {
        http_response_code(500);
        echo json_encode(['error' => $conn->error]);
        return;
    }

    $rows = [];
    while ($row = $result->fetch_assoc()) {
        $rows[] = $row;
    }

    echo json_encode($rows);
}



function getAveragePlayTimePerPlayer($conn){
    $sql = "
    SELECT
      JSON_OBJECT(
        'player_id', playerId,
        'average_playtime', AVG(TIMESTAMPDIFF(MINUTE, startedAt, endedAt))
      ) AS player_avg
    FROM session
    GROUP BY playerId;
    ";
    $result = $conn->query($sql);

    if (!$result) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => $conn->error]);
        return;
    }

    $data = [];

    while ($row = $result->fetch_assoc()) {
        $data[] = json_decode($row['player_avg'], true);
    }

    echo json_encode($data);

}