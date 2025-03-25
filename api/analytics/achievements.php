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
            $action = isset($_GET["action"]) ? $_GET["action"] : "total_per_game";

            if ($action === "top_players") {
                getTopPlayersWithAchievements($conn);
            } else {
                getTotalAchievementsEarnedPerGame($conn);
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

/**
 * Join Query: Display top players and their unlocked achievements by joining the Players, Achievements, and Sessions tables.
 *
 * This function retrieves top players based on their scores and shows their unlocked achievements
 * by joining the player, player_stats, player_achievement, and achievement tables.
 */
function getTopPlayersWithAchievements($conn) {
    $limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 10;

    $sql = "
    SELECT 
        p.id,
        p.username,
        p.country,
        ps.totalScore,
        COUNT(pa.achievementId) as total_achievements,
        GROUP_CONCAT(a.title SEPARATOR ', ') as achievements
    FROM 
        player p
    JOIN 
        player_stats ps ON p.id = ps.playerId
    LEFT JOIN 
        player_achievement pa ON p.id = pa.playerId
    LEFT JOIN 
        achievement a ON pa.achievementId = a.id
    GROUP BY 
        p.id
    ORDER BY 
        ps.totalScore DESC, total_achievements DESC
    LIMIT ?
    ";

    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => $conn->error]);
        return;
    }

    $stmt->bind_param("i", $limit);
    $stmt->execute();
    $result = $stmt->get_result();

    $players = [];
    while ($row = $result->fetch_assoc()) {
        $players[] = $row;
    }

    echo json_encode($players);
}

/**
 * Aggregation Query: Compute average playtime per player and total achievements per game.
 *
 * This function calculates the total number of achievements earned per game
 * by aggregating player achievements data across multiple tables.
 */
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