CREATE TABLE team
(
    id      int          NOT NULL AUTO_INCREMENT,
    name    varchar(255) NOT NULL,
    ranking int,
    PRIMARY KEY (id)
);

CREATE TABLE player
(
    id          int          NOT NULL AUTO_INCREMENT,
    username    varchar(255) NOT NULL,
    dateOfBirth DATE         NOT NULL,
    age         int          NOT NULL,
    country     varchar(255) NOT NULL,
    teamId      int,
    joinedOn DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    FOREIGN KEY (teamId) REFERENCES team (id) ON DELETE CASCADE
);

CREATE TABLE premium_player
(
    id           INT PRIMARY KEY,
    subscribedOn DATE NOT NULL,
    FOREIGN KEY (id) REFERENCES player (id) ON DELETE CASCADE
);

CREATE TABLE achievement
(
    id          int          NOT NULL AUTO_INCREMENT,
    title       varchar(255) NOT NULL,
    unlockScore int          NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game
(
    id          int          NOT NULL AUTO_INCREMENT,
    title       varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE game_achievement
(
    achievementId int,
    gameId        int,
    rewardPoints  int NOT NULL,
    PRIMARY KEY (achievementId, gameId),
    FOREIGN KEY (gameId) REFERENCES game (id) ON DELETE CASCADE,
    FOREIGN KEY (achievementId) REFERENCES achievement (id) ON DELETE CASCADE
);

CREATE TABLE player_game
(
    playerId int,
    gameId   int,
    level    varchar(255) NOT NULL,
    PRIMARY KEY (playerId, gameId),
    FOREIGN KEY (playerId) REFERENCES player (id) ON DELETE CASCADE,
    FOREIGN KEY (gameId) REFERENCES game (id) ON DELETE CASCADE
);

CREATE TABLE player_achievement
(
    playerId      int,
    achievementId int,
    achievedAt    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (playerId, achievementId),
    FOREIGN KEY (playerId) REFERENCES player (id) ON DELETE CASCADE,
    FOREIGN KEY (achievementId) REFERENCES achievement (id) ON DELETE CASCADE
);

CREATE TABLE player_stats
(
    playerId         int,
    totalGamesPlayed int NOT NULL DEFAULT 0,
    totalScore       int NOT NULL DEFAULT 0,
    PRIMARY KEY (playerId),
    FOREIGN KEY (playerId) REFERENCES player (id) ON DELETE CASCADE
);

CREATE TABLE session
(
    id        int  NOT NULL AUTO_INCREMENT,
    playerId  int  NOT NULL,
    gameId    int  NOT NULL,
    score     int  NOT NULL,
    startedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    endedAt   DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (playerId) REFERENCES player (id) ON DELETE CASCADE,
    FOREIGN KEY (gameId) REFERENCES game (id) ON DELETE CASCADE
);

CREATE TABLE item
(
    id          int          NOT NULL AUTO_INCREMENT,
    gameId      int,
    name        varchar(255) NOT NULL,
    type        varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (gameId) REFERENCES game (id) ON DELETE CASCADE
);



