<?php

$hostname = "127.0.0.1";
$user = "root";
$password = "replace with your own";
$database = "replace with your own";

$conn = new mysqli($hostname, $user, $password, $database);

if ($conn->connect_error) {
    die(json_encode(['error' => 'Connection failed: ' . $conn->connect_error]));
}
