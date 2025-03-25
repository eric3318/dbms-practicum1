-- Clean up if needed (if you want to run this script multiple times)
-- SET FOREIGN_KEY_CHECKS = 0;
-- TRUNCATE TABLE player_achievement;
-- TRUNCATE TABLE player_game; 
-- TRUNCATE TABLE player_stats;
-- TRUNCATE TABLE session;
-- TRUNCATE TABLE premium_player;
-- TRUNCATE TABLE player;
-- TRUNCATE TABLE team;
-- TRUNCATE TABLE game_achievement;
-- TRUNCATE TABLE achievement;
-- TRUNCATE TABLE game;
-- TRUNCATE TABLE item;
-- SET FOREIGN_KEY_CHECKS = 1;

-- Insert teams
INSERT INTO team (id, name, ranking) VALUES
(1, 'Alpha Team', 1),
(2, 'Beta Squad', 2),
(3, 'Gamma Force', 3),
(4, 'Delta Raiders', 4),
(5, 'Omega Legends', 5);

-- Insert players with different age ranges, countries and teams
INSERT INTO player (id, username, dateOfBirth, age, country, teamId, joinedOn) VALUES
(1, 'player1', '1995-05-10', 28, 'USA', 1, '2023-01-15 10:30:00'),
(2, 'player2', '1998-02-22', 25, 'Canada', 1, '2023-02-10 14:20:00'),
(3, 'player3', '1990-11-05', 33, 'Germany', 2, '2023-01-20 09:45:00'),
(4, 'player4', '2000-07-30', 23, 'France', 2, '2023-03-05 16:10:00'),
(5, 'player5', '1993-04-18', 30, 'Japan', 3, '2023-02-28 11:25:00'),
(6, 'player6', '2002-09-12', 21, 'South Korea', 3, '2023-01-10 13:40:00'),
(7, 'player7', '1997-06-25', 26, 'Brazil', 4, '2023-03-15 15:50:00'),
(8, 'player8', '1999-03-03', 24, 'Australia', 4, '2023-02-05 10:15:00'),
(9, 'player9', '1994-12-14', 29, 'UK', 5, '2023-01-25 12:30:00'),
(10, 'player10', '2001-08-09', 22, 'Russia', 5, '2023-03-10 17:20:00');

-- Insert premium players
INSERT INTO premium_player (id, subscribedOn) VALUES
(1, '2023-02-01'),
(3, '2023-02-15'),
(5, '2023-03-01'),
(7, '2023-03-15'),
(9, '2023-04-01');

-- Insert games
INSERT INTO game (id, title, description) VALUES
(1, 'Epic Quest', 'A fantasy role-playing adventure'),
(2, 'Space Explorer', 'Explore the vast universe in this space simulation'),
(3, 'Racing Champions', 'High-speed racing competition'),
(4, 'Puzzle Master', 'Brain-teasing puzzle challenges'),
(5, 'Battle Royale', 'Last player standing competitive action'),
(6, 'Strategy Empire', 'Build and manage your own empire'),
(7, 'Horror Mansion', 'Survive the night in a haunted mansion'),
(8, 'Sports League', 'Compete in various sports championships'),
(9, 'Fantasy Wars', 'Epic battles in a fantasy world'),
(10, 'City Builder', 'Design and construct your dream city'),
(11, 'Zombie Survival', 'Survive in a post-apocalyptic zombie world'),
(12, 'Fighting Tournament', 'Compete against skilled fighters from around the world'),
(13, 'Mystery Detective', 'Solve complex crimes as a brilliant detective'),
(14, 'Farming Simulator', 'Build and manage your own farm'),
(15, 'Space Colony', 'Establish and grow a colony on a distant planet'),
(16, 'Treasure Hunter', 'Search for hidden treasures across the world'),
(17, 'Monster Tamer', 'Collect and train mystical creatures'),
(18, 'Musical Maestro', 'Become a musical legend through rhythm challenges'),
(19, 'Medieval Kingdom', 'Rule a medieval kingdom through war and diplomacy'),
(20, 'Underwater Adventure', 'Explore the depths of mysterious oceans');

-- Insert achievements
INSERT INTO achievement (id, title, unlockScore) VALUES
(1, 'First Victory', 100),
(2, 'Speed Runner', 200),
(3, 'Master Player', 500),
(4, 'Achievement Hunter', 300),
(5, 'Perfect Score', 1000),
(6, 'Legendary Status', 2000),
(7, 'Rookie Champion', 150),
(8, 'Tactical Genius', 400),
(9, 'Unstoppable', 800),
(10, 'World Record', 1500),
(11, 'Precision Master', 750),
(12, 'Collection Complete', 1200),
(13, 'Survival Expert', 600),
(14, 'Team Leader', 350),
(15, 'Global Competitor', 900),
(16, 'Quick Learner', 250),
(17, 'Ultimate Challenge', 1800),
(18, 'Strategic Mind', 550),
(19, 'Resource Master', 700),
(20, 'Grand Champion', 2500);

-- Connect achievements to games (expanded to more connections)
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES
(1, 1, 10),
(2, 1, 20),
(3, 2, 50),
(4, 2, 30),
(5, 3, 100),
(6, 3, 200),
(7, 4, 15),
(8, 4, 40),
(9, 5, 80),
(10, 5, 150),
(11, 6, 75),
(12, 7, 120),
(13, 8, 60),
(14, 9, 35),
(15, 10, 90),
(16, 11, 25),
(17, 12, 180),
(18, 13, 55),
(19, 14, 70),
(20, 15, 250),
(1, 16, 15),
(5, 17, 95),
(9, 18, 85),
(13, 19, 65),
(17, 20, 175);

-- Insert player-game relationships with levels
INSERT INTO player_game (playerId, gameId, level) VALUES
(1, 1, 'Expert'),
(1, 2, 'Intermediate'),
(2, 1, 'Beginner'),
(2, 3, 'Advanced'),
(3, 2, 'Expert'),
(3, 4, 'Master'),
(4, 3, 'Intermediate'),
(4, 5, 'Beginner'),
(5, 4, 'Advanced'),
(5, 1, 'Master'),
(6, 5, 'Expert'),
(6, 2, 'Beginner'),
(7, 1, 'Advanced'),
(7, 3, 'Master'),
(8, 2, 'Intermediate'),
(8, 4, 'Expert'),
(9, 3, 'Beginner'),
(9, 5, 'Advanced'),
(10, 4, 'Master'),
(10, 1, 'Intermediate');

-- Insert player achievements
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES
(1, 1, '2023-02-10 14:30:00'),
(1, 3, '2023-03-15 16:45:00'),
(2, 2, '2023-02-20 11:20:00'),
(2, 5, '2023-04-05 09:30:00'),
(3, 4, '2023-03-01 13:15:00'),
(3, 6, '2023-04-10 15:40:00'),
(4, 1, '2023-02-15 10:10:00'),
(4, 7, '2023-03-20 12:25:00'),
(5, 3, '2023-03-05 18:50:00'),
(5, 8, '2023-04-15 14:35:00'),
(6, 5, '2023-03-10 11:55:00'),
(6, 9, '2023-04-20 16:20:00'),
(7, 2, '2023-03-15 09:40:00'),
(7, 10, '2023-04-25 13:05:00'),
(8, 4, '2023-03-20 17:15:00'),
(8, 6, '2023-05-01 10:50:00'),
(9, 1, '2023-03-25 12:30:00'),
(9, 8, '2023-05-05 15:45:00'),
(10, 3, '2023-03-30 14:20:00'),
(10, 9, '2023-05-10 11:10:00');

-- Insert player statistics
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES
(1, 42, 8750),
(2, 36, 7200),
(3, 58, 12500),
(4, 27, 5400),
(5, 45, 9800),
(6, 33, 6600),
(7, 51, 11200),
(8, 39, 7800),
(9, 47, 10500),
(10, 30, 6000);

-- Insert gaming sessions spanning different weeks for weekly aggregation
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES
-- Week 1
(1, 1, 1, 450, '2023-03-01 10:00:00', '2023-03-01 11:30:00'),
(2, 2, 2, 320, '2023-03-02 14:00:00', '2023-03-02 15:15:00'),
(3, 3, 3, 580, '2023-03-03 09:30:00', '2023-03-03 11:00:00'),
(4, 4, 4, 210, '2023-03-04 16:45:00', '2023-03-04 17:30:00'),
(5, 5, 5, 780, '2023-03-05 13:20:00', '2023-03-05 15:00:00'),

-- Week 2
(6, 1, 2, 380, '2023-03-08 11:15:00', '2023-03-08 12:45:00'),
(7, 2, 3, 420, '2023-03-09 15:30:00', '2023-03-09 17:00:00'),
(8, 3, 4, 290, '2023-03-10 10:45:00', '2023-03-10 12:00:00'),
(9, 4, 5, 650, '2023-03-11 18:00:00', '2023-03-11 19:30:00'),
(10, 5, 1, 540, '2023-03-12 14:30:00', '2023-03-12 16:15:00'),

-- Week 3
(11, 6, 1, 410, '2023-03-15 09:00:00', '2023-03-15 10:30:00'),
(12, 7, 2, 570, '2023-03-16 13:45:00', '2023-03-16 15:15:00'),
(13, 8, 3, 330, '2023-03-17 17:30:00', '2023-03-17 18:45:00'),
(14, 9, 4, 620, '2023-03-18 12:15:00', '2023-03-18 14:00:00'),
(15, 10, 5, 490, '2023-03-19 16:00:00', '2023-03-19 17:45:00'),

-- Week 4
(16, 6, 2, 350, '2023-03-22 10:30:00', '2023-03-22 11:45:00'),
(17, 7, 3, 630, '2023-03-23 15:00:00', '2023-03-23 16:45:00'),
(18, 8, 4, 270, '2023-03-24 18:15:00', '2023-03-24 19:30:00'),
(19, 9, 5, 520, '2023-03-25 13:00:00', '2023-03-25 14:30:00'),
(20, 10, 1, 480, '2023-03-26 11:45:00', '2023-03-26 13:15:00'),

-- Additional sessions for better data distribution
(21, 1, 3, 590, '2023-03-29 14:15:00', '2023-03-29 16:00:00'),
(22, 2, 4, 340, '2023-03-30 11:30:00', '2023-03-30 12:45:00'),
(23, 3, 5, 720, '2023-03-31 17:00:00', '2023-03-31 19:00:00'),
(24, 4, 1, 430, '2023-04-01 09:45:00', '2023-04-01 11:15:00'),
(25, 5, 2, 560, '2023-04-02 15:30:00', '2023-04-02 17:15:00'),
(26, 6, 3, 310, '2023-04-03 12:00:00', '2023-04-03 13:30:00'),
(27, 7, 4, 680, '2023-04-04 18:30:00', '2023-04-04 20:15:00'),
(28, 8, 5, 390, '2023-04-05 10:15:00', '2023-04-05 11:45:00'),
(29, 9, 1, 740, '2023-04-06 16:45:00', '2023-04-06 18:30:00'),
(30, 10, 2, 360, '2023-04-07 13:15:00', '2023-04-07 14:45:00');

-- Insert game items
INSERT INTO item (id, gameId, name, type, description) VALUES
(1, 1, 'Magic Sword', 'Weapon', 'A powerful sword with magical abilities'),
(2, 1, 'Health Potion', 'Consumable', 'Restores 50 health points'),
(3, 2, 'Laser Cannon', 'Weapon', 'High-powered space weapon'),
(4, 2, 'Shield Generator', 'Defense', 'Creates a protective energy shield'),
(5, 3, 'Turbo Boost', 'Upgrade', 'Increases vehicle speed by 25%'),
(6, 3, 'All-Terrain Tires', 'Equipment', 'Provides better handling on all surfaces'),
(7, 4, 'Hint Token', 'Consumable', 'Reveals a hint for difficult puzzles'),
(8, 4, 'Time Extender', 'Powerup', 'Adds 30 seconds to the timer'),
(9, 5, 'Assault Rifle', 'Weapon', 'Standard military-grade weapon'),
(10, 5, 'Medkit', 'Consumable', 'Fully restores health'),
(11, 6, 'Command Center', 'Building', 'Central hub for your empire'),
(12, 7, 'Flashlight', 'Tool', 'Illuminates dark areas'),
(13, 8, 'Sports Gear', 'Equipment', 'Professional grade sporting equipment'),
(14, 9, 'Magic Staff', 'Weapon', 'Channels powerful magical spells'),
(15, 10, 'Construction Kit', 'Tool', 'Essential tools for building structures'),
(16, 11, 'Survival Kit', 'Equipment', 'Basic tools for wilderness survival'),
(17, 12, 'Training Gloves', 'Equipment', 'Improves fighting technique'),
(18, 13, 'Magnifying Glass', 'Tool', 'Helps find hidden clues'),
(19, 14, 'Seed Pack', 'Consumable', 'Various seeds to plant crops'),
(20, 15, 'Oxygen Generator', 'Equipment', 'Provides breathable air in space'); 