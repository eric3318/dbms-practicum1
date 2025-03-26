<?php
// filepath: /path/to/your/api/auth.php

header("Content-Type: application/json");
session_start();

// // Mock database for demonstration purposes
// $users = [
//     'admin_user' => ['password' => 'hashed_password_admin', 'email' => 'admin@example.com'],
//     'regular_user' => ['password' => 'hashed_password_user', 'email' => 'user@example.com']
// ];

// Helper function to send JSON responses
function sendResponse($success, $message, $data = null) {
    echo json_encode(['success' => $success, 'message' => $message, 'data' => $data]);
    exit;
}

// Handle incoming requests
$input = json_decode(file_get_contents("php://input"), true);
$action = $input['action'] ?? $_GET['action'] ?? null;

if ($action === 'login') {
    $username = $input['username'] ?? '';
    $password = $input['password'] ?? '';

    if (isset($users[$username]) && $users[$username]['password'] === $password) {
        $_SESSION['user'] = $username;
        sendResponse(true, "Login successful", ['username' => $username]);
    } else {
        sendResponse(false, "Invalid username or password");
    }
} elseif ($action === 'register') {
    $username = $input['username'] ?? '';
    $password = $input['password'] ?? '';
    $email = $input['email'] ?? '';

    if (isset($users[$username])) {
        sendResponse(false, "Username already exists");
    } elseif (empty($username) || empty($password) || empty($email)) {
        sendResponse(false, "All fields are required");
    } else {
        // In a real application, you would save this to a database
        $users[$username] = ['password' => $password, 'email' => $email];
        sendResponse(true, "Registration successful");
    }
} elseif ($action === 'logout') {
    session_destroy();
    sendResponse(true, "Logout successful");
} elseif ($action === 'check') {
    if (isset($_SESSION['user'])) {
        sendResponse(true, "User is authenticated", ['username' => $_SESSION['user']]);
    } else {
        sendResponse(false, "User is not authenticated");
    }
} else {
    sendResponse(false, "Invalid action");
}
?>