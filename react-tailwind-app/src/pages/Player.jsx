import React, { useEffect, useState } from 'react';
import { getPlayers, getPlayer, updatePlayer, deletePlayer } from '../services/playerService';

const Player = () => {
  const [players, setPlayers] = useState([]);
  const [searchId, setSearchId] = useState('');
  const [editingId, setEditingId] = useState(null);
  const [form, setForm] = useState({
    username: '',
    dateOfBirth: '',
    age: '',
    country: '',
    teamId: ''
  });

  const loadPlayers = async () => {
    try {
      console.log('Fetching players...');
      const data = await getPlayers();
      console.log('Fetched players:', data);
      setPlayers(data);
    } catch (err) {
      console.error('Error fetching players:', err);
    }
  };  

  useEffect(() => {
    loadPlayers();
  }, []);

  const handleDelete = async (id) => {
    if (!window.confirm('Are you sure you want to delete this player?')) return;
    try {
      await deletePlayer(id);
      setPlayers(players.filter((p) => p.id !== id));
    } catch (err) {
      console.error('Error deleting player:', err);
    }
  };

  const handleEdit = async (id) => {
    try {
      const data = await getPlayer(id);
      setEditingId(id);
      setForm({
        username: data.username,
        dateOfBirth: data.dateOfBirth,
        age: data.age,
        country: data.country,
        teamId: data.teamId,
      });
    } catch (err) {
      console.error('Error loading player for edit:', err);
    }
  };

  const handleSave = async () => {
    try {
      console.log('Saving player:', editingId, form);
      await updatePlayer(editingId, form);
      await loadPlayers();
      setEditingId(null);
    } catch (err) {
      console.error('Error saving player:', err);
    }
  };

  const handleCancel = () => {
    setEditingId(null);
  };

  const handleChange = (e) => {
    setForm({ ...form, [e.target.name]: e.target.value });
  };

  const filteredPlayers = players.filter((p) =>
    searchId === '' ? true : p.id.toString().includes(searchId)
  );

  return (
    <div className="p-6">
      <h1 className="text-2xl font-bold mb-4">Player Management</h1>

      {/* Search */}
      <div className="mb-4">
        <input
          type="text"
          placeholder="Search by Player ID"
          value={searchId}
          onChange={(e) => setSearchId(e.target.value)}
          className="border px-4 py-2 rounded w-64"
        />
      </div>

      <table className="w-full border-collapse border">
        <thead>
          <tr className="bg-gray-100">
            <th className="border p-2">ID</th>
            <th className="border p-2">Username</th>
            <th className="border p-2">DOB</th>
            <th className="border p-2">Age</th>
            <th className="border p-2">Country</th>
            <th className="border p-2">Team ID</th>
            <th className="border p-2">Joined On</th>
            <th className="border p-2">Actions</th>
          </tr>
        </thead>
        <tbody>
          {filteredPlayers.map((player) => (
            <tr key={player.id} className="border hover:bg-gray-50">
              <td className="border p-2">{player.id}</td>
              {editingId === player.id ? (
                <>
                  <td className="border p-2">
                    <input name="username" value={form.username} onChange={handleChange} className="border p-1" />
                  </td>
                  <td className="border p-2">
                    <input name="dateOfBirth" value={form.dateOfBirth} onChange={handleChange} type="date" className="border p-1" />
                  </td>
                  <td className="border p-2">
                    <input name="age" value={form.age} onChange={handleChange} type="number" className="border p-1" />
                  </td>
                  <td className="border p-2">
                    <input name="country" value={form.country} onChange={handleChange} className="border p-1" />
                  </td>
                  <td className="border p-2">
                    <input name="teamId" value={form.teamId} onChange={handleChange} type="number" className="border p-1" />
                  </td>
                  <td className="border p-2">{player.joinedOn}</td>
                  <td className="border p-2">
                    <button onClick={handleSave} className="bg-green-500 text-white px-2 py-1 rounded mr-2">Save</button>
                    <button onClick={handleCancel} className="bg-gray-500 text-white px-2 py-1 rounded">Cancel</button>
                  </td>
                </>
              ) : (
                <>
                  <td className="border p-2">{player.username}</td>
                  <td className="border p-2">{player.dateOfBirth}</td>
                  <td className="border p-2">{player.age}</td>
                  <td className="border p-2">{player.country}</td>
                  <td className="border p-2">{player.teamId}</td>
                  <td className="border p-2">{player.joinedOn}</td>
                  <td className="border p-2">
                    <button onClick={() => handleEdit(player.id)} className="bg-blue-500 text-white px-2 py-1 rounded mr-2">Edit</button>
                    <button onClick={() => handleDelete(player.id)} className="bg-red-500 text-white px-2 py-1 rounded">Delete</button>
                  </td>
                </>
              )}
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Player;
