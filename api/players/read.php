<?php
header("Content-Type: application/json; charset=UTF-8");
include_once '../../config/db_config.php';

$conn = getConnection();

// 获取所有玩家数据
function getAllPlayers($conn) {
    $sql = "SELECT * FROM Players ORDER BY total_score DESC";
    $result = $conn->query($sql);
    $players = [];
    
    while($row = $result->fetch_assoc()) {
        $players[] = $row;
    }
    
    return $players;
}

// 获取单个玩家数据
function getPlayerById($conn, $id) {
    $stmt = $conn->prepare("SELECT * FROM Players WHERE player_id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    return $result->fetch_assoc();
}

// 处理请求
$player_id = isset($_GET['id']) ? $_GET['id'] : null;
$response = [];

if ($player_id) {
    $response = getPlayerById($conn, $player_id);
} else {
    $response = getAllPlayers($conn);
}

echo json_encode($response);
$conn->close();
?> 