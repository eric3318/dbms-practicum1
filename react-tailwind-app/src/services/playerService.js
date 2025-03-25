const BASE_URL = "http://localhost/dbms-practicum1/api/players.php";

// GET all players (join query for top players with achievements)
export const getPlayers = async () => {
  const response = await fetch(BASE_URL);
  if (!response.ok) throw new Error("Failed to fetch players");
  return await response.json();
};

// GET single player by ID
export const getPlayer = async (id) => {
  const response = await fetch(`${BASE_URL}/${id}`);
  if (!response.ok) throw new Error("Failed to fetch player");
  return await response.json();
};

// PUT update player by ID
export const updatePlayer = async (id, payload) => {
  const response = await fetch(`${BASE_URL}/${id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(payload),
  });

  if (!response.ok) throw new Error("Failed to update player");
  return await response.json();
};

// DELETE player by ID
export const deletePlayer = async (id) => {
  const response = await fetch(`${BASE_URL}/${id}`, {
    method: "DELETE",
  });

  if (!response.ok) throw new Error("Failed to delete player");
  return await response.json();
};
