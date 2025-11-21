-- Puzzle #74: Bowling League

DROP DATABASE IF EXISTS puzzle74;
CREATE DATABASE puzzle74;
USE puzzle74;

-- Step 1: Create table
CREATE TABLE scores (
    GameID INT,
    Bowler VARCHAR(50),
    Score INT
);
