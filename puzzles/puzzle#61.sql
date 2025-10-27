-- Puzzle #61 — Player Scores

-- Step 1: Utworzenie bazy i tabeli
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS PlayerScores;

CREATE TABLE PlayerScores (
    AttemptID INT,
    PlayerID INT,
    Score INT
);
