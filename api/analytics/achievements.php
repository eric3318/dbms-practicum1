<?php

include_once "config/db.php";

header("Content-type: application/json; charset=utf-8");

$method = $_SERVER["REQUEST_METHOD"];
$path = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
$segments = explode("/", trim($path, "/"));
$input = file_get_contents("php://input");

try {
    switch ($method) {
        case "GET":
            getTotalAchievementsEarnedPerGame($conn);
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

function getTotalAchievementsEarnedPerGame($conn){
    $sql = "
    SELECT 
        g.id,
        g.title,
        COUNT(pa.achievementId) AS total_achievements_earned
    FROM game g
    JOIN achievement a ON a.gameId = g.id
    JOIN player_achievement pa ON pa.achievementId = a.achievementId
    GROUP BY g.id, g.title;
    ";
    $result = $conn->query($sql);
    $rows = $conn->fetchAll(MYSQLI_ASSOC);
    echo json_encode($rows);
}
