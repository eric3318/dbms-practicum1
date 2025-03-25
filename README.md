# dbms-practicum1

## Project Description
Backend implementation of a Game Data Management System, including player data, game achievements, and game session management features.

## Project Structure
- `api/`: API interface files
  - `player.php`: Player management related API
  - `analytics/`: Analytics related API
- `config/`: Configuration files
  - `db.php`: Database connection configuration
- `sql/`: SQL script files
- `frontend/`: Simple frontend interface for testing API
  - `index.html`: Main interface HTML
  - `style.css`: Style file
  - `script.js`: JavaScript interaction logic

## Usage
1. Configure database connection (modify the `config/db.php` file)
2. Access API endpoints via browser or use the frontend interface
3. Frontend interface access address: `http://localhost/frontend/`

## API Endpoints
- `GET /api/player.php`: Get all player information
- `GET /api/player.php?type=premium`: Filter players by type
- `GET /api/player.php?ageBetween=18,30`: Filter players by age range
- `GET /api/player.php/123`: Get player information for ID 123
- `GET /api/analytics/achievements.php?action=top_players`: Get top players and their achievements
- `PUT /api/player.php/123`: Update player information for ID 123
- `DELETE /api/player.php/123`: Delete player with ID 123
