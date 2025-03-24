<?php
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
include_once '../../config/db_config.php';

$conn = getConnection();

// 接收POST数据
$data = json_decode(file_get_contents("php://input"));

if(!isset($data->username) || !isset($data->email)) {
    echo json_encode(["error" => "Missing required fields"]);
    exit();
}

// 创建新玩家
$sql = "INSERT INTO Players (username, email) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $data->username, $data->email);

if($stmt->execute()) {
    echo json_encode([
        "message" => "Player created successfully",
        "player_id" => $conn->insert_id
    ]);
} else {
    echo json_encode(["error" => "Failed to create player"]);
}

$stmt->close();
$conn->close();
?> 