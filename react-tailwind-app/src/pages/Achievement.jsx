import React, { useEffect, useState } from 'react';
import { getTopPlayersWithAchievements } from '../services/achievementService';

const Achievement = () => {
  const [players, setPlayers] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    const loadPlayers = async () => {
      try {
        const result = await getTopPlayersWithAchievements(); // Default limit 5
        setPlayers(result);
      } catch (err) {
        setError(err.message);
      }
    };

    loadPlayers();
  }, []);

  return (
    <div className="max-w-5xl mx-auto p-6">
      <h1 className="text-3xl font-bold mb-6">🏆 Top 5 Players & Achievements</h1>

      {error && (
        <div className="bg-red-100 text-red-700 p-4 mb-4 rounded">
          Error: {error}
        </div>
      )}

      <div className="overflow-x-auto">
        <table className="w-full table-auto border border-gray-300 bg-white shadow-md rounded-lg">
          <thead className="bg-gray-100">
            <tr>
              <th className="p-3 border">Player ID</th>
              <th className="p-3 border">Username</th>
              <th className="p-3 border">Total Score</th>
              <th className="p-3 border">Achievements</th>
            </tr>
          </thead>
          <tbody>
            {players.map((player) => (
              <tr key={player.id} className="hover:bg-gray-50">
                <td className="p-3 border">{player.id}</td>
                <td className="p-3 border">{player.username}</td>
                <td className="p-3 border">{player.totalScore}</td>
                <td className="p-3 border">
                  {player.achievements
                    ? player.achievements.split(',').map((a, i) => (
                        <span
                          key={i}
                          className="inline-block bg-blue-100 text-blue-800 text-xs px-2 py-1 rounded-full mr-1 mb-1"
                        >
                          {a.trim()}
                        </span>
                      ))
                    : '—'}
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default Achievement;
