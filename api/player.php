<?php

require_once __DIR__ . '/../config/db.php';

header("Content-type: application/json; charset=utf-8");

$method = $_SERVER["REQUEST_METHOD"];
$path = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
$segments = explode("/", trim($path, "/"));
$input = file_get_contents("php://input");

try {
    // Check for special action parameter
    $action = isset($_GET["action"]) ? $_GET["action"] : null;
    
    if ($method === "GET" && $action === "top_with_achievements") {
        // Redirect to the achievements.php endpoint
        header("Location: /api/analytics/achievements.php?action=top_players");
        exit;
    }
    
    switch ($method) {
        case "GET":
            $id = $segments[3];
            if (isset($id) && is_numeric($id)) {
                getPlayer($conn, $id);
                return;
            }
            $params = $_GET;
            getPlayers($conn, $params);
            break;
        case "PUT":
            $id = $segments[3];
            $payload = json_decode($input, true);
            updatePlayer($conn, $id, $payload);
            break;
        case "DELETE":
            $id = $segments[3];
            deletePlayer($conn, $id);
            break;
    }
} catch (Exception $e) {
    http_response_code($e->getCode());
    echo $e->getMessage();
}

/**
 * This function retrieves a single player by ID.
 */
function getPlayer($conn, $id)
{
    $sql = "
    SELECT *
    FROM player
    WHERE id = $id 
    ";
    $result = $conn->query($sql);
    $row = $result->fetch_assoc();
    if (!$row) {
        http_response_code(404);
        echo json_encode(["error" => "Player not found"]);
        return;
    }
    echo json_encode($row);
}

/**
 * Filtering & Ranking Query: Display the top 5 players with the highest scores dynamically.
 * 
 * This function allows filtering players based on various criteria such as type, date range, and age.
 */
function getPlayers($conn, $params)
{
    $where = [];
    $join = "";
    if (isset($params['type'])) {
        if ($params['type'] == "premium") {
            $join = "JOIN premium_player p ON p.id = player.id";
        }
    }

    if (isset($params['start']) || isset($params['end'])) {
        if (!(isset($params['start']) && isset($params['end']))) {
            throw new Exception("Start and end must be both present when either is provided");
        }
        $start = $params['start'];
        $end = $params['end'];
        $where[] = "player.joinedOn BETWEEN $start AND $end";
    }

    if (isset($params['ageBetween'])) {
        $arr = explode(",", $params['ageBetween']);
        if (sizeof($arr) != 2) {
            throw new Exception("Invalid ageBetween query parameter");
        }
        $ageFrom = (int)$arr[0];
        $ageTo = (int)$arr[1];
        if ($ageFrom > $ageTo) {
            throw new Exception("AgeBetween must be numbers in ascending order formatted in from,to");
        }
        $where[] = "player.age BETWEEN $ageFrom AND $ageTo";
    }

    $sql = "
    SELECT player.*
    FROM player
    $join
    " . (count($where) > 0 ? "WHERE " . implode(" AND ", $where) : "") . "
    ";

    $result = $conn->query($sql);
    $players = $result->fetch_all(MYSQLI_ASSOC);
    echo json_encode($players);
}

/**
 * Update Operation: Allow users to modify player profile details through a web form.
 * 
 * This function handles updating player information like username, date of birth, country, and team.
 */
function updatePlayer($conn, $id, $payload)
{
    $fields = [];
    $types = '';
    $values = [];

    if (isset($payload["username"])) {
        $fields[] = "username = ?";
        $types .= 's';
        $values[] = $payload["username"];
    }

    if (isset($payload["dateOfBirth"])) {
        $fields[] = "dateOfBirth = ?";
        $types .= 's';
        $values[] = $payload["dateOfBirth"];
    }

    if (isset($payload["country"])) {
        $fields[] = "country = ?";
        $types .= 's';
        $values[] = $payload["country"];
    }

    if (isset($payload["teamId"])) {
        $fields[] = "teamId = ?";
        $types .= 'i';
        $values[] = $payload["teamId"];
    }

    if (empty($fields)) {
        http_response_code(400);
        echo json_encode(["status" => "error", "message" => "At lease one of username, dateOfBirth, country is required."]);
        return;
    }

    $sql = "UPDATE player SET " . implode(", ", $fields) . " WHERE id = ?";
    $types .= 'i';
    $values[] = $id;

    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        throw new Exception($conn->error);
    }

    $stmt->bind_param($types, ...$values);
    $stmt->execute();

    if ($stmt->affected_rows == 0) {
        echo json_encode(["status"=>"error", "message" => "Update player $id failed."]);
        return;
    }

    echo json_encode(["status"=>"success", "message" => "Player $id updated successfully"]);
}

/**
 * Delete Operation (Cascade on Delete): Ensure deleting a player removes related sessions and achievements automatically.
 * 
 * This function handles the deletion of a player while relying on database foreign key constraints
 * to automatically remove related data in other tables (CASCADE DELETE).
 */
function deletePlayer($conn, $id)
{
    $sql = "DELETE FROM player WHERE id = ?";
    $stmt = $conn->prepare($sql);
    if (!$stmt) {
        throw new Exception($conn->error);
    }
    $stmt->bind_param("i", $id);
    $stmt->execute();
    if ($stmt->affected_rows == 0) {
        echo json_encode(["status"=>"error", "message" => "Delete player $id failed"]);
    }
    echo json_encode(["message" => "Player deleted successfully"]);
}


