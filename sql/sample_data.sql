-- insert sample data
INSERT INTO Players (username, email) VALUES
('player1', 'player1@example.com'),
('player2', 'player2@example.com'),
('player3', 'player3@example.com'),
('player4', 'player4@example.com'),
('player5', 'player5@example.com');

-- insert sample achievements data
INSERT INTO Achievements (name, description, points) VALUES
('First Win', 'Win your first game', 100),
('Speed Runner', 'Complete level under 1 minute', 200),
('Master Player', 'Reach level 10', 500),
('Achievement Hunter', 'Unlock 10 achievements', 300),
('Perfect Score', 'Score 1000 points in one game', 1000);

-- insert sample gaming sessions data
INSERT INTO Gaming_Sessions (player_id, start_time, end_time, score) VALUES
(1, '2024-03-10 10:00:00', '2024-03-10 11:00:00', 500),
(2, '2024-03-10 11:30:00', '2024-03-10 12:30:00', 750),
(3, '2024-03-10 13:00:00', '2024-03-10 14:00:00', 600),
(4, '2024-03-10 14:30:00', '2024-03-10 15:30:00', 800),
(5, '2024-03-10 16:00:00', '2024-03-10 17:00:00', 900); 