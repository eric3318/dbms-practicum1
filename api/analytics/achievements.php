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
        g.id AS gameId,
        g.title AS gameTitle,
        COUNT(pa.achievementId) AS totalAchievementsEarned
    FROM player_achievement pa
    JOIN game_achievement ga ON ga.achievementId = pa.achievementId
    JOIN game g ON g.id = ga.gameId
    GROUP BY g.id, g.title
    ORDER BY totalAchievementsEarned DESC;
    ";
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $rows = $conn->fetchAll(MYSQLI_ASSOC);
        echo json_encode($rows);
        return;
     }
    echo json_encode([]);
}
