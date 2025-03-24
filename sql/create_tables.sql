-- 玩家表
CREATE TABLE Players (
    player_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_score INT DEFAULT 0,
    rank_level INT DEFAULT 1
);

-- 游戏成就表
CREATE TABLE Achievements (
    achievement_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    points INT DEFAULT 0
);

-- 玩家成就关联表
CREATE TABLE Player_Achievements (
    player_id INT,
    achievement_id INT,
    unlock_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (player_id, achievement_id),
    FOREIGN KEY (player_id) REFERENCES Players(player_id) ON DELETE CASCADE,
    FOREIGN KEY (achievement_id) REFERENCES Achievements(achievement_id)
);

-- 游戏会话表
CREATE TABLE Gaming_Sessions (
    session_id INT PRIMARY KEY AUTO_INCREMENT,
    player_id INT,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    score INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES Players(player_id) ON DELETE CASCADE
); 