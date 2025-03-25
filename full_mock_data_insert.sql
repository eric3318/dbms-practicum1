INSERT INTO team (id, name, ranking) VALUES (1, 'Team 1', 45);
INSERT INTO team (id, name, ranking) VALUES (2, 'Team 2', 20);
INSERT INTO team (id, name, ranking) VALUES (3, 'Team 3', 20);
INSERT INTO team (id, name, ranking) VALUES (4, 'Team 4', 11);
INSERT INTO team (id, name, ranking) VALUES (5, 'Team 5', 45);
INSERT INTO player (id, username, dateOfBirth, age, country, teamId) VALUES
(1, 'SpongePop', '2000-06-26', 25, 'China', 3),
(2, 'KnightRider92', '1992-03-15', 20, 'UK', 4),
(3, 'NekoNinja93', '1993-04-15', 21, 'Japan', 1),
(4, 'GhostWolf94', '1994-05-15', 22, 'UK', 3),
(5, 'IronValkyrie95', '1995-06-15', 23, 'Germany', 3),
(6, 'SniperQueen96', '1996-07-15', 24, 'UK', 4),
(7, 'SilentStorm97', '1997-08-15', 25, 'UK', 1),
(8, 'SakuraSpeed98', '1998-09-15', 26, 'Japan', 4),
(9, 'MapleFury99', '1999-01-15', 27, 'Canada', 1),
(10, 'FrostByte90', '1990-02-15', 18, 'Canada', 2),
(11, 'TokyoSamurai91', '1991-03-15', 19, 'Japan', 1),
(12, 'BlitzKrieg92', '1992-04-15', 20, 'Germany', 3),
(13, 'VortexBeast93', '1993-05-15', 21, 'Germany', 3),
(14, 'ZenMaster94', '1994-06-15', 22, 'Japan', 2),
(15, 'CanuckRogue95', '1995-07-15', 23, 'Canada', 3),
(16, 'PixelPioneer96', '1996-08-15', 24, 'Canada', 3),
(17, 'MechaHunter97', '1997-09-15', 25, 'Germany', 1),
(18, 'NeoTokyo98', '1998-01-15', 26, 'Japan', 4),
(19, 'EagleOne99', '1999-02-15', 27, 'USA', 2),
(20, 'BritBlaze90', '1990-03-15', 18, 'UK', 5);

INSERT INTO premium_player (id, subscribedOn) VALUES (1, '2023-02-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (2, '2023-03-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (3, '2023-04-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (4, '2023-05-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (5, '2023-06-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (6, '2023-07-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (7, '2023-08-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (8, '2023-09-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (9, '2023-01-01');
INSERT INTO premium_player (id, subscribedOn) VALUES (10, '2023-02-01');
INSERT INTO achievement (id, title, unlockScore) VALUES
(1, 'First Blood', 100),
(2, 'Sharp Shooter', 300),
(3, 'Marathon Runner', 500),
(4, 'Unstoppable', 800),
(5, 'Master Explorer', 700),
(6, 'Treasure Hunter', 600),
(7, 'Combo King', 400),
(8, 'The Strategist', 450),
(9, 'Survivor', 350),
(10, 'Quick Thinker', 550),
(11, 'Sniper Elite', 750),
(12, 'Boss Slayer', 900),
(13, 'Puzzle Master', 620),
(14, 'Untouchable', 670),
(15, 'Speed Demon', 720),
(16, 'Battle Tactician', 820),
(17, 'Flawless Victory', 1000),
(18, 'XP Grinder', 250),
(19, 'Ultimate Collector', 880),
(20, 'Legendary Hero', 1100);

INSERT INTO game (id, title, description) VALUES 
(1, 'Cyber Strike', 'A futuristic cyberpunk shooter with fast-paced action.'),
(2, 'Kingdom Clash', 'Real-time strategy game where empires battle for dominance.'),
(3, 'Mystic Quest', 'Embark on a magical adventure through enchanted lands.'),
(4, 'Galaxy Raiders', 'Space-faring roguelike game with epic starship battles.'),
(5, 'Zombie Outbreak', 'Survive waves of zombies in this post-apocalyptic thriller.'),
(6, 'Battlefield Honor', 'Military FPS with realistic combat and team objectives.'),
(7, 'Dungeon Explorer', 'Classic dungeon crawler with loot, traps, and monsters.'),
(8, 'Sky Racers', 'High-speed aerial racing through breathtaking skies.'),
(9, 'Pixel Planet', 'Open-world sandbox game with pixel art and crafting.'),
(10, 'Samurai Saga', 'Hack-and-slash set in feudal Japan with rich storytelling.'),
(11, 'Alien Invasion', 'Defend Earth from extraterrestrial threats in co-op mode.'),
(12, 'Pirate’s Plunder', 'Sail the high seas and hunt for legendary treasures.'),
(13, 'Ninja Rush', 'Fast-paced stealth platformer with deadly combos.'),
(14, 'Robot Arena', 'Battle AI robots in a competitive multiplayer arena.'),
(15, 'Magic Tactics', 'Turn-based tactical RPG with spellcasting and summoning.'),
(16, 'Monster Farm', 'Raise, train, and battle monsters in a colorful world.'),
(17, 'Shadow Ops', 'Covert missions, sabotage, and tactical stealth gameplay.'),
(18, 'Frozen Realms', 'Explore icy kingdoms and solve ancient frozen mysteries.'),
(19, 'Dragon Slayer', 'Epic fantasy RPG with dragons, quests, and treasures.'),
(20, 'Virtual Racer X', 'Next-gen racing with VR immersion and insane tracks.');

INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (7, 19, 45);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (14, 19, 38);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (8, 6, 75);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (4, 12, 37);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (16, 14, 52);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (20, 11, 31);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (14, 15, 83);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (14, 5, 94);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (13, 9, 44);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (6, 14, 25);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (20, 15, 82);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (1, 9, 31);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (10, 7, 63);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (11, 12, 70);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (5, 3, 80);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (11, 17, 78);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (3, 17, 13);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (2, 13, 48);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (15, 7, 60);
INSERT INTO game_achievement (achievementId, gameId, rewardPoints) VALUES (8, 3, 61);
INSERT INTO player_game (playerId, gameId, level) VALUES (4, 10, 'Level 6');
INSERT INTO player_game (playerId, gameId, level) VALUES (11, 19, 'Level 2');
INSERT INTO player_game (playerId, gameId, level) VALUES (6, 13, 'Level 10');
INSERT INTO player_game (playerId, gameId, level) VALUES (9, 17, 'Level 5');
INSERT INTO player_game (playerId, gameId, level) VALUES (3, 6, 'Level 1');
INSERT INTO player_game (playerId, gameId, level) VALUES (3, 9, 'Level 4');
INSERT INTO player_game (playerId, gameId, level) VALUES (13, 1, 'Level 3');
INSERT INTO player_game (playerId, gameId, level) VALUES (7, 3, 'Level 5');
INSERT INTO player_game (playerId, gameId, level) VALUES (13, 6, 'Level 6');
INSERT INTO player_game (playerId, gameId, level) VALUES (8, 15, 'Level 8');
INSERT INTO player_game (playerId, gameId, level) VALUES (6, 14, 'Level 2');
INSERT INTO player_game (playerId, gameId, level) VALUES (7, 16, 'Level 3');
INSERT INTO player_game (playerId, gameId, level) VALUES (12, 4, 'Level 9');
INSERT INTO player_game (playerId, gameId, level) VALUES (14, 11, 'Level 3');
INSERT INTO player_game (playerId, gameId, level) VALUES (8, 19, 'Level 1');
INSERT INTO player_game (playerId, gameId, level) VALUES (2, 12, 'Level 3');
INSERT INTO player_game (playerId, gameId, level) VALUES (6, 12, 'Level 4');
INSERT INTO player_game (playerId, gameId, level) VALUES (14, 1, 'Level 6');
INSERT INTO player_game (playerId, gameId, level) VALUES (4, 19, 'Level 1');
INSERT INTO player_game (playerId, gameId, level) VALUES (9, 12, 'Level 8');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (3, 10, '2024-01-01');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (14, 17, '2024-02-02');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (6, 12, '2024-03-03');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (13, 11, '2024-04-04');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (19, 8, '2024-05-05');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (4, 12, '2024-06-06');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (4, 17, '2024-07-07');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (18, 17, '2024-08-08');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (20, 6, '2024-09-09');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (19, 18, '2024-01-010');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (19, 17, '2024-02-011');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (5, 16, '2024-03-012');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (9, 13, '2024-04-013');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (11, 9, '2024-05-014');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (20, 12, '2024-06-015');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (14, 7, '2024-07-016');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (13, 1, '2024-08-017');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (10, 14, '2024-09-018');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (4, 15, '2024-01-019');
INSERT INTO player_achievement (playerId, achievementId, achievedAt) VALUES (12, 10, '2024-02-020');
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (1, 9, 1546);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (2, 8, 1330);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (3, 11, 3414);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (4, 11, 4467);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (5, 5, 3806);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (6, 7, 1740);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (7, 11, 2084);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (8, 13, 1484);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (9, 7, 2669);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (10, 9, 3422);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (11, 14, 4813);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (12, 11, 4929);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (13, 12, 1461);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (14, 14, 2332);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (15, 12, 4735);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (16, 12, 4641);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (17, 8, 2623);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (18, 10, 1023);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (19, 6, 3191);
INSERT INTO player_stats (playerId, totalGamesPlayed, totalScore) VALUES (20, 9, 3038);
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (1, 6, 17, 179, '2024-04-06 10:00:00', '2024-06-03 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (2, 11, 6, 664, '2024-04-06 10:00:00', '2024-04-08 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (3, 4, 10, 513, '2024-04-05 10:00:00', '2024-10-03 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (4, 14, 1, 718, '2024-04-01 10:00:00', '2024-05-01 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (5, 2, 4, 948, '2024-04-05 10:00:00', '2024-04-07 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (6, 19, 3, 728, '2024-04-02 10:00:00', '2024-09-01 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (7, 3, 4, 280, '2024-04-05 10:00:00', '2024-04-07 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (8, 5, 6, 651, '2024-04-09 10:00:00', '2024-07-04 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (9, 1, 10, 448, '2024-04-08 10:00:00', '2024-04-09 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (10, 2, 2, 978, '2024-04-02 10:00:00', '2024-06-02 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (11, 8, 3, 550, '2024-04-02 10:00:00', '2024-05-02 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (12, 11, 10, 261, '2024-04-06 10:00:00', '2024-11-02 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (13, 10, 6, 572, '2024-04-03 10:00:00', '2024-04-07 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (14, 14, 15, 466, '2024-04-02 10:00:00', '2024-04-09 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (15, 20, 18, 212, '2024-04-01 10:00:00', '2024-04-08 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (16, 5, 1, 572, '2024-04-03 10:00:00', '2024-04-15 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (17, 2, 16, 332, '2024-04-04 10:00:00', '2024-04-08 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (18, 18, 14, 828, '2024-04-03 10:00:00', '2024-04-30 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (19, 6, 5, 143, '2024-04-04 10:00:00', '2024-07-20 11:00:00');
INSERT INTO session (id, playerId, gameId, score, startedAt, endedAt) VALUES (20, 12, 14, 764, '2024-04-05 10:00:00', '2024-08-03 11:00:00');
INSERT INTO item (id, gameId, name, type, description) VALUES (1, 9, 'Item 1', 'type1', 'Description for item 1');
INSERT INTO item (id, gameId, name, type, description) VALUES (2, 15, 'Item 2', 'type2', 'Description for item 2');
INSERT INTO item (id, gameId, name, type, description) VALUES (3, 9, 'Item 3', 'type3', 'Description for item 3');
INSERT INTO item (id, gameId, name, type, description) VALUES (4, 2, 'Item 4', 'type4', 'Description for item 4');
INSERT INTO item (id, gameId, name, type, description) VALUES (5, 8, 'Item 5', 'type0', 'Description for item 5');
INSERT INTO item (id, gameId, name, type, description) VALUES (6, 10, 'Item 6', 'type1', 'Description for item 6');
INSERT INTO item (id, gameId, name, type, description) VALUES (7, 19, 'Item 7', 'type2', 'Description for item 7');
INSERT INTO item (id, gameId, name, type, description) VALUES (8, 9, 'Item 8', 'type3', 'Description for item 8');
INSERT INTO item (id, gameId, name, type, description) VALUES (9, 12, 'Item 9', 'type4', 'Description for item 9');
INSERT INTO item (id, gameId, name, type, description) VALUES (10, 5, 'Item 10', 'type0', 'Description for item 10');
INSERT INTO item (id, gameId, name, type, description) VALUES (11, 15, 'Item 11', 'type1', 'Description for item 11');
INSERT INTO item (id, gameId, name, type, description) VALUES (12, 8, 'Item 12', 'type2', 'Description for item 12');
INSERT INTO item (id, gameId, name, type, description) VALUES (13, 18, 'Item 13', 'type3', 'Description for item 13');
INSERT INTO item (id, gameId, name, type, description) VALUES (14, 20, 'Item 14', 'type4', 'Description for item 14');
INSERT INTO item (id, gameId, name, type, description) VALUES (15, 11, 'Item 15', 'type0', 'Description for item 15');
INSERT INTO item (id, gameId, name, type, description) VALUES (16, 19, 'Item 16', 'type1', 'Description for item 16');
INSERT INTO item (id, gameId, name, type, description) VALUES (17, 9, 'Item 17', 'type2', 'Description for item 17');
INSERT INTO item (id, gameId, name, type, description) VALUES (18, 4, 'Item 18', 'type3', 'Description for item 18');
INSERT INTO item (id, gameId, name, type, description) VALUES (19, 1, 'Item 19', 'type4', 'Description for item 19');
INSERT INTO item (id, gameId, name, type, description) VALUES (20, 8, 'Item 20', 'type0', 'Description for item 20');
