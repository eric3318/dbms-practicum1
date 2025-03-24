<?php
header("Content-Type: application/json; charset=UTF-8");
include_once '../../config/db_config.php';

$conn = getConnection();

// 获取前5名玩家
function getTopPlayers($conn, $limit = 5) {
    $sql = "SELECT 
                p.username,
                p.total_score,
                p.rank_level,
                COUNT(DISTINCT pa.achievement_id) as achievements_count
            FROM Players p
            LEFT JOIN Player_Achievements pa ON p.player_id = pa.player_id
            GROUP BY p.player_id
            ORDER BY p.total_score DESC
            LIMIT ?";
    
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $limit);
    $stmt->execute();
    $result = $stmt->get_result();
    
    $players = [];
    while($row = $result->fetch_assoc()) {
        $players[] = $row;
    }
    
    return $players;
}

// 处理请求
$limit = isset($_GET['limit']) ? (int)$_GET['limit'] : 5;
$top_players = getTopPlayers($conn, $limit);

echo json_encode($top_players);
$conn->close();
?> 