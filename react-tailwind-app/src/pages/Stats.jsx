import React, { useEffect, useState } from 'react';
import { getTotalAchievementsPerGame } from '../services/achievementService';
import { getAveragePlayTimePerPlayer, getWeeklyPlayTimeByPlayer } from '../services/playtimeService';

const Stats = () => {
  const [avgPlaytime, setAvgPlaytime] = useState([]);
  const [weeklyPlaytime, setWeeklyPlaytime] = useState([]);
  const [achievementStats, setAchievementStats] = useState([]);
  const [error, setError] = useState(null);
  const [startDate, setStartDate] = useState('');

  const fetchStats = async (customStart = '') => {
    try {
      const [avgData, weeklyData, achievements] = await Promise.all([
        getAveragePlayTimePerPlayer(),
        getWeeklyPlayTimeByPlayer(customStart),
        getTotalAchievementsPerGame()
      ]);
      setAvgPlaytime(avgData);
      setWeeklyPlaytime(weeklyData);
      setAchievementStats(achievements);
    } catch (err) {
      console.error('Failed to fetch stats:', err);
      setError(err.message);
    }
  };

  useEffect(() => {
    fetchStats(); // Initial load
  }, []);

  const handleFilter = () => {
    fetchStats(startDate); // Trigger fetch with selected start date
  };

  return (
    <div className="p-6 max-w-7xl mx-auto">
      <h1 className="text-3xl font-bold mb-6">📊 Game Statistics</h1>

      {error && (
        <div className="bg-red-100 text-red-800 p-4 rounded mb-4">
          Error: {error}
        </div>
      )}

      {/* 🔍 Start Date Picker + Button */}
      <div className="mb-6 flex flex-col md:flex-row gap-4 items-start md:items-end">
        <div>
          <label className="block mb-1 font-medium text-gray-700">📅 Filter Weekly Playtime From:</label>
          <input
            type="date"
            value={startDate}
            onChange={(e) => setStartDate(e.target.value)}
            className="border px-4 py-2 rounded shadow"
          />
        </div>
        <button
          onClick={handleFilter}
          className="bg-blue-500 hover:bg-blue-600 text-white px-5 py-2 rounded shadow mt-2 md:mt-0"
        >
          Filter
        </button>
      </div>

      {/* Player Stats Section */}
      <section className="mb-10">
        <h2 className="text-2xl font-semibold mb-4">👤 Player Stats</h2>

        {/* Average Playtime */}
        <div className="mb-6">
          <h3 className="text-xl font-medium mb-2">Average Playtime Per Player</h3>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
            {avgPlaytime.map((player, index) => (
              <div key={index} className="bg-white shadow rounded p-4 border">
                <p><strong>Player ID:</strong> {player.player_id}</p>
                <p><strong>Avg. Playtime:</strong> {player.average_playtime} mins</p>
              </div>
            ))}
          </div>
        </div>

        {/* Weekly Playtime */}
        <div>
          <h3 className="text-xl font-medium mb-2">⏱️ Weekly Playtime Grouped by Player</h3>
          <div className="overflow-x-auto">
            <table className="w-full text-left border border-gray-200 bg-white shadow rounded">
              <thead className="bg-gray-100">
                <tr>
                  <th className="p-2 border">Player ID</th>
                  <th className="p-2 border">Week</th>
                  <th className="p-2 border">Playtime (mins)</th>
                </tr>
              </thead>
              <tbody>
                {weeklyPlaytime.map((row, index) => (
                  <tr key={index} className="hover:bg-gray-50">
                    <td className="p-2 border">{row.player_id}</td>
                    <td className="p-2 border">{row.week_range || row.week}</td>
                    <td className="p-2 border">{row.duration}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        </div>
      </section>

      {/* Achievement Stats Section */}
      <section>
        <h2 className="text-2xl font-semibold mb-4">🏆 Achievement Stats</h2>
        <div className="overflow-x-auto">
          <table className="w-full text-left border border-gray-200 bg-white shadow rounded">
            <thead className="bg-gray-100">
              <tr>
                <th className="p-2 border">Game ID</th>
                <th className="p-2 border">Game Title</th>
                <th className="p-2 border">Total Achievements</th>
              </tr>
            </thead>
            <tbody>
              {achievementStats.map((row, index) => (
                <tr key={index} className="hover:bg-gray-50">
                  <td className="p-2 border">{row.gameId}</td>
                  <td className="p-2 border">{row.title || row.gameTitle}</td>
                  <td className="p-2 border">{row.totalAchievements || row.totalAchievementsEarned}</td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </section>
    </div>
  );
};

export default Stats;
