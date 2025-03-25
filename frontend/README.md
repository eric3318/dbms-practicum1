# Game Player Management System Frontend

This is a simple frontend interface for testing and verifying the Game Player Management System API functionality.

## Features

- View all players list
- Filter players by type and age range
- Edit player information
- Delete players
- View top players and their achievements

## Usage

1. Make sure the PHP server is running and API endpoints are accessible
2. Place the frontend files in the web server's root directory
3. Access the frontend page in a browser (e.g., http://localhost/frontend/)

## API Base URL Configuration

If the API is not in the default path, please modify the `API_BASE_URL` variable in the `script.js` file:

```javascript
// API base URL - adjust if needed
const API_BASE_URL = '/api';
```

## Notes

- This frontend interface is for testing and verifying API functionality only
- Consider adding more security measures in a production environment
- Ensure the database configuration is correct for the API to work properly 