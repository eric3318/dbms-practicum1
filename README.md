# dbms-practicum1

## Project Description
Game analytics engine
## Project Structure
- `api/`: API interface files
  - `player.php`: Player management related API
  - `analytics/`: Analytics related API
- `config/`: Configuration files
  - `db.php`: Database connection configuration
- `sql/`: SQL script files

## Usage
1. Configure database connection (modify the `config/db.php` file)
2. Create tables in your database using /config/schema.sql
3. Insert mock data using /sql/full_mock_data_insert.sql
4. Place /api and /config into /htdocs in XAMPP server
5. in /react-tailwind-app, run npm install, then npm start to start the frontend
6. Access the frontend at `http://localhost:3000/`

## API Endpoints
- `GET /api/player.php`: Get all player information
- `GET /api/player.php?type=premium`: Filter players by type
- `GET /api/player.php?ageBetween=18,30`: Filter players by age range
- `GET /api/player.php/123`: Get player information for ID 123
- `GET /api/analytics/achievements.php?action=top_players`: Get top players and their achievements
- `PUT /api/player.php/123`: Update player information for ID 123
- `DELETE /api/player.php/123`: Delete player with ID 123
- `GET /api/analytics/playtime.php?type=total`: Get total playtime per week grouped by player
- `GET /api/analytics/playtime.php?type=average`: Get average playtime per player

