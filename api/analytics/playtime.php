<?php

require_once __DIR__ . '/../../config/db.php';

header("Content-type: application/json; charset=utf-8");

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
    if ($id == null) {
        $sql = "
        SELECT JSON_ARRAYAGG(
            JSON_OBJECT(
                'player_id', p.id,
                'week', YEARWEEK(s.startedAt, 1),
                'duration', SUM(TIMESTAMPDIFF(MINUTE, s.startedAt, s.endedAt))
            )
        ) AS playtime_per_week
        FROM session s
        JOIN player p ON p.id = s.playerId
        GROUP BY p.id, YEARWEEK(s.startedAt, 1);
        ";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            echo json_encode($row);
            return;
        }
        echo json_encode([]);
        return;
    }
    $sql = "
            SELECT JSON_ARRAYAGG(
                JSON_OBJECT(
                    'player_id', p.id,
                    'week', YEARWEEK(s.date, 1),
                    'duration', SUM(TIMESTAMPDIFF(MINUTE, s.startedAt, s.endedAt))
                )
            ) AS playtime_per_week
            FROM session s
            JOIN player p ON p.id = s.playerId
            WHERE p.id = $id
            GROUP BY p.id, YEARWEEK(s.date, 1);
        ";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode($row);
        return;
    }
    echo json_encode([]);
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