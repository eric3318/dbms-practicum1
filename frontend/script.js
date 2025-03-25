document.addEventListener('DOMContentLoaded', function() {
    // Initial load of players
    loadPlayers();

    // Event listeners
    document.getElementById('apply-filters').addEventListener('click', loadPlayers);
    document.getElementById('load-top-players').addEventListener('click', loadTopPlayers);
    document.getElementById('player-form').addEventListener('submit', savePlayer);
    document.getElementById('cancel-button').addEventListener('click', hidePlayerForm);
});

// Get the base URL based on the current location
const getBaseUrl = () => {
    // Check if we're in a subdirectory of the domain
    const pathParts = window.location.pathname.split('/');
    if (pathParts.length > 2 && pathParts[1] === 'frontend') {
        // We're in /frontend/, so API is at /api/
        return '/api';
    } else {
        // We might be at the root, so API would be at /api/
        return '/api';
    }
};

// API base URL - dynamically set based on current location
const API_BASE_URL = getBaseUrl();

// Load all players with optional filters
function loadPlayers() {
    const typeFilter = document.getElementById('type-filter').value;
    const ageFrom = document.getElementById('age-from').value;
    const ageTo = document.getElementById('age-to').value;
    
    let url = `${API_BASE_URL}/player.php?`;
    
    if (typeFilter) {
        url += `type=${typeFilter}&`;
    }
    
    if (ageFrom && ageTo) {
        url += `ageBetween=${ageFrom},${ageTo}&`;
    }
    
    // Remove trailing &
    url = url.slice(0, -1);
    
    fetch(url)
        .then(response => response.json())
        .then(data => {
            displayPlayers(data);
        })
        .catch(error => {
            console.error('Error loading players:', error);
            alert('Failed to load player data, check console for details.');
        });
}

// Display players in the table
function displayPlayers(players) {
    const tableBody = document.getElementById('players-list');
    tableBody.innerHTML = '';
    
    if (!players.length) {
        tableBody.innerHTML = '<tr><td colspan="7" style="text-align: center;">没有找到玩家</td></tr>';
        return;
    }
    
    players.forEach(player => {
        const row = document.createElement('tr');
        
        row.innerHTML = `
            <td>${player.id}</td>
            <td>${player.username}</td>
            <td>${player.dateOfBirth}</td>
            <td>${player.age}</td>
            <td>${player.country}</td>
            <td>${player.joinedOn}</td>
            <td>
                <button class="action-btn edit-btn" data-id="${player.id}">编辑</button>
                <button class="action-btn delete-btn" data-id="${player.id}">删除</button>
            </td>
        `;
        
        tableBody.appendChild(row);
    });
    
    // Add event listeners to buttons
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function() {
            const playerId = this.getAttribute('data-id');
            editPlayer(playerId);
        });
    });
    
    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function() {
            const playerId = this.getAttribute('data-id');
            deletePlayer(playerId);
        });
    });
}

// Load a specific player for editing
function editPlayer(playerId) {
    fetch(`${API_BASE_URL}/player.php/${playerId}`)
        .then(response => response.json())
        .then(player => {
            document.getElementById('form-title').textContent = 'Edit Player';
            document.getElementById('player-id').value = player.id;
            document.getElementById('username').value = player.username;
            document.getElementById('date-of-birth').value = player.dateOfBirth;
            document.getElementById('country').value = player.country;
            document.getElementById('team-id').value = player.teamId || '';
            
            document.getElementById('player-form-card').style.display = 'block';
            window.scrollTo(0, document.getElementById('player-form-card').offsetTop);
        })
        .catch(error => {
            console.error('Error loading player details:', error);
            alert('Failed to load player details, check console for details.');
        });
}

// Save player (update)
function savePlayer(event) {
    event.preventDefault();
    
    const playerId = document.getElementById('player-id').value;
    
    const playerData = {
        username: document.getElementById('username').value,
        dateOfBirth: document.getElementById('date-of-birth').value,
        country: document.getElementById('country').value,
        teamId: document.getElementById('team-id').value || null
    };
    
    fetch(`${API_BASE_URL}/player.php/${playerId}`, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(playerData)
    })
    .then(response => response.json())
    .then(data => {
        if (data.status === 'success') {
            alert('Player updated successfully!');
            hidePlayerForm();
            loadPlayers();
        } else {
            alert(`Update failed: ${data.message}`);
        }
    })
    .catch(error => {
        console.error('Error updating player:', error);
        alert('Failed to update player, check console for details.');
    });
}

// Delete a player
function deletePlayer(playerId) {
    if (confirm('Are you sure you want to delete this player? This action cannot be undone!')) {
        fetch(`${API_BASE_URL}/player.php/${playerId}`, {
            method: 'DELETE'
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            loadPlayers();
        })
        .catch(error => {
            console.error('Error deleting player:', error);
            alert('Failed to delete player, check console for details.');
        });
    }
}

// Hide the player form
function hidePlayerForm() {
    document.getElementById('player-form-card').style.display = 'none';
    document.getElementById('player-form').reset();
}

// Load top players with achievements
function loadTopPlayers() {
    fetch(`${API_BASE_URL}/analytics/achievements.php?action=top_players`)
        .then(response => response.json())
        .then(data => {
            displayTopPlayers(data);
        })
        .catch(error => {
            console.error('Error loading top players:', error);
            alert('Failed to load top players, check console for details.');
        });
}

// Display top players in the table
function displayTopPlayers(players) {
    const tableBody = document.getElementById('top-players-list');
    tableBody.innerHTML = '';
    
    if (!players.length) {
        tableBody.innerHTML = '<tr><td colspan="5" style="text-align: center;">No players found</td></tr>';
        return;
    }
    
    players.forEach(player => {
        const row = document.createElement('tr');
        
        row.innerHTML = `
            <td>${player.id}</td>
            <td>${player.username}</td>
            <td>${player.country}</td>
            <td>${player.totalScore || '0'}</td>
            <td>${player.achievements || player.total_achievements + ' achievements'}</td>
        `;
        
        tableBody.appendChild(row);
    });
} 