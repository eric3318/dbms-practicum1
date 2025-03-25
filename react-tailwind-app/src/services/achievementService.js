export const getTotalAchievementsPerGame = async () => {
  const res = await fetch('http://localhost/dbms-practicum1/api/analytics/achievements.php');
  const text = await res.text();
  console.log("Achievements Raw:", text);
  
  try {
    return JSON.parse(text);
  } catch (err) {
    throw new Error("Invalid JSON from achievements");
  }
};

export const getTopPlayersWithAchievements = async (limit = 5) => {
  const res = await fetch(`http://localhost/dbms-practicum1/api/analytics/achievements.php?action=top_players&limit=${limit}`);

  const text = await res.text(); // Handle raw response
  console.log('Top Players Response:', text);

  if (!res.ok) {
    throw new Error('Failed to fetch top players with achievements');
  }

  try {
    return JSON.parse(text);
  } catch (err) {
    console.error('Invalid JSON received:', err);
    throw new Error('Invalid JSON received');
  }
};
