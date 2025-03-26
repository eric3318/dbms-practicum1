-- Insert users
INSERT INTO users (id, username, password, email) VALUES 
(1, 'admin_user', 'hashed_password_admin', 'admin@example.com'),
(2, 'regular_user', 'hashed_password_user', 'user@example.com');

-- Assign roles to users
INSERT INTO user_roles (user_id, role_id) VALUES 
(1, 1), -- admin_user is assigned the admin role
(2, 2); -- regular_user is assigned the user role

-- Insert teams with created_by and updated_by
INSERT INTO team (id, name, ranking, created_by, updated_by) VALUES 
(1, 'Team 1', 45, 'admin_user', 'admin_user'),
(2, 'Team 2', 20, 'admin_user', 'regular_user'),
(3, 'Team 3', 20, 'regular_user', 'regular_user'),
(4, 'Team 4', 11, 'admin_user', 'admin_user'),
(5, 'Team 5', 45, 'regular_user', 'admin_user');

-- Insert players with created_by and updated_by
INSERT INTO player (id, username, dateOfBirth, age, country, teamId, created_at, updated_at, created_by, updated_by) VALUES
(1, 'player1', '2000-01-01', 24, 'USA', 1, '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 'player2', '2000-02-01', 23, 'UK', 2, '2023-02-01 10:00:00', '2023-02-01 11:00:00', 'regular_user', 'admin_user'),
(3, 'player3', '2000-03-01', 22, 'Canada', 3, '2023-03-01 10:00:00', '2023-03-01 11:00:00', 'admin_user', 'admin_user'),
(4, 'player4', '2000-04-01', 21, 'Australia', 4, '2023-04-01 10:00:00', '2023-04-01 11:00:00', 'regular_user', 'regular_user'),
(5, 'player5', '2000-05-01', 20, 'Germany', 5, '2023-05-01 10:00:00', '2023-05-01 11:00:00', 'admin_user', 'regular_user'),
(6, 'player6', '2000-06-01', 19, 'France', 1, '2023-06-01 10:00:00', '2023-06-01 11:00:00', 'admin_user', 'regular_user'),
(7, 'player7', '2000-07-01', 18, 'Italy', 2, '2023-07-01 10:00:00', '2023-07-01 11:00:00', 'regular_user', 'admin_user'),
(8, 'player8', '2000-08-01', 17, 'Spain', 3, '2023-08-01 10:00:00', '2023-08-01 11:00:00', 'admin_user', 'admin_user'),
(9, 'player9', '2000-09-01', 16, 'Brazil', 4, '2023-09-01 10:00:00', '2023-09-01 11:00:00', 'regular_user', 'regular_user'),
(10, 'player10', '2000-10-01', 15, 'Argentina', 5, '2023-10-01 10:00:00', '2023-10-01 11:00:00', 'admin_user', 'regular_user');


-- Insert premium players with created_by and updated_by
INSERT INTO premium_player (id, subscribedOn, created_at, updated_at, created_by, updated_by) VALUES
(1, '2023-01-01', '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, '2023-02-01', '2023-02-01 10:00:00', '2023-02-01 11:00:00', 'regular_user', 'admin_user');

-- Insert achievements with created_by and updated_by
INSERT INTO achievement (id, title, unlockScore, created_at, updated_at, created_by, updated_by) VALUES
(1, 'Achievement 1', 100, '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 'Achievement 2', 200, '2023-02-01 10:00:00', '2023-02-01 11:00:00', 'regular_user', 'admin_user'),
(3, 'Achievement 3', 300, '2023-03-01 10:00:00', '2023-03-01 11:00:00', 'admin_user', 'admin_user'),
(4, 'Achievement 4', 400, '2023-04-01 10:00:00', '2023-04-01 11:00:00', 'regular_user', 'regular_user'),
(5, 'Achievement 5', 500, '2023-05-01 10:00:00', '2023-05-01 11:00:00', 'admin_user', 'regular_user');

-- Insert games with created_by and updated_by
INSERT INTO game (id, title, description, created_at, updated_at, created_by, updated_by) VALUES 
(1, 'Cyber Strike', 'A futuristic cyberpunk shooter with fast-paced action.', '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 'Kingdom Clash', 'Real-time strategy game where empires battle for dominance.', '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'regular_user', 'admin_user'),
(3, 'Mystic Quest', 'Embark on a magical adventure through enchanted lands.', '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'admin_user'),
(4, 'Galaxy Raiders', 'Space-faring roguelike game with epic starship battles.', '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'regular_user', 'regular_user'),
(5, 'Zombie Outbreak', 'Survive waves of zombies in this post-apocalyptic thriller.', '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user');

-- Insert game achievements with created_by and updated_by
INSERT INTO game_achievement (achievementId, gameId, rewardPoints, created_at, updated_at, created_by, updated_by) VALUES
(1, 1, 100, '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 2, 200, '2023-02-01 10:00:00', '2023-02-01 11:00:00', 'regular_user', 'admin_user'),
(3, 3, 300, '2023-03-01 10:00:00', '2023-03-01 11:00:00', 'admin_user', 'admin_user'),
(4, 4, 400, '2023-04-01 10:00:00', '2023-04-01 11:00:00', 'regular_user', 'regular_user'),
(5, 5, 500, '2023-05-01 10:00:00', '2023-05-01 11:00:00', 'admin_user', 'regular_user');

-- Insert player games with created_by and updated_by
INSERT INTO player_game (playerId, gameId, level, created_at, updated_at, created_by, updated_by) VALUES
(1, 1, 10, '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 2, 20, '2023-02-01 10:00:00', '2023-02-01 11:00:00', 'regular_user', 'admin_user'),
(3, 3, 30, '2023-03-01 10:00:00', '2023-03-01 11:00:00', 'admin_user', 'admin_user'),
(4, 4, 40, '2023-04-01 10:00:00', '2023-04-01 11:00:00', 'regular_user', 'regular_user'),
(5, 5, 50, '2023-05-01 10:00:00', '2023-05-01 11:00:00', 'admin_user', 'regular_user'); 


-- Insert player achievements with created_by and updated_by
INSERT INTO player_achievement (playerId, achievementId, achievedAt, created_at, updated_at, created_by, updated_by) VALUES
(1, 1, '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 2, '2023-02-01 10:00:00', '2023-02-01 11:00:00', 'regular_user', 'admin_user'),
(3, 3, '2023-03-01 10:00:00', '2023-03-01 11:00:00', 'admin_user', 'admin_user'),
(4, 4, '2023-04-01 10:00:00', '2023-04-01 11:00:00', 'regular_user', 'regular_user'),
(5, 5, '2023-05-01 10:00:00', '2023-05-01 11:00:00', 'admin_user', 'regular_user');

-- Insert player stats with created_by and updated_by
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore, created_at, updated_at, created_by, updated_by) VALUES
(1, 10, 1000, '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 20, 2000, '2023-02-01 10:00:00', '2023-02-01 11:00:00', 'regular_user', 'admin_user'),
(3, 30, 3000, '2023-03-01 10:00:00', '2023-03-01 11:00:00', 'admin_user', 'admin_user'),
(4, 40, 4000, '2023-04-01 10:00:00', '2023-04-01 11:00:00', 'regular_user', 'regular_user'),
(5, 50, 5000, '2023-05-01 10:00:00', '2023-05-01 11:00:00', 'admin_user', 'regular_user');

-- Insert sessions with created_by and updated_by
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt, created_at, updated_at, created_by, updated_by) VALUES
(1, 1, 1, 100, '2023-01-01 10:00:00', '2023-01-01 8:00:00', '2023-01-01 10:00:00', '2023-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 2, 2, 200, '2023-02-01 10:00:00', '2023-02-01 8:00:00', '2023-02-01 10:00:00', '2023-02-01 11:00:00', 'regular_user', 'admin_user'),
(3, 3, 3, 300, '2023-03-01 10:00:00', '2023-03-01 8:00:00', '2023-03-01 10:00:00', '2023-03-01 11:00:00', 'admin_user', 'admin_user'),
(4, 4, 4, 400, '2023-04-01 10:00:00', '2023-04-01 8:00:00', '2023-04-01 10:00:00', '2023-04-01 11:00:00', 'regular_user', 'regular_user'),
(5, 5, 5, 500, '2023-05-01 10:00:00', '2023-05-01 8:00:00', '2023-05-01 10:00:00', '2023-05-01 11:00:00', 'admin_user', 'regular_user');

-- Insert items
INSERT INTO item (id, gameId, name, type, description, created_at, updated_at, created_by, updated_by) VALUES
(1, 1, 'Item 1', 'type1', 'Description for item 1', '2024-01-01 10:00:00', '2024-01-01 11:00:00', 'admin_user', 'regular_user'),
(2, 2, 'Item 2', 'type2', 'Description for item 2', '2024-02-01 10:00:00', '2024-02-01 11:00:00', 'regular_user', 'admin_user'),
(3, 3, 'Item 3', 'type3', 'Description for item 3', '2024-03-01 10:00:00', '2024-03-01 11:00:00', 'admin_user', 'admin_user'),
(4, 4, 'Item 4', 'type4', 'Description for item 4', '2024-04-01 10:00:00', '2024-04-01 11:00:00', 'regular_user', 'regular_user'),
(5, 5, 'Item 5', 'type0', 'Description for item 5', '2024-05-01 10:00:00', '2024-05-01 11:00:00', 'admin_user', 'regular_user'),
(6, 1, 'Item 6', 'type1', 'Description for item 6', '2024-01-01 10:00:00', '2024-01-01 11:00:00', 'admin_user', 'regular_user'),
(7, 2, 'Item 7', 'type2', 'Description for item 7', '2024-02-01 10:00:00', '2024-02-01 11:00:00', 'regular_user', 'admin_user'),
(8, 3, 'Item 8', 'type3', 'Description for item 8', '2024-03-01 10:00:00', '2024-03-01 11:00:00', 'admin_user', 'admin_user');

