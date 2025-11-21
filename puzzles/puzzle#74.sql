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


-- Step 2: Insert sample data
INSERT INTO scores (GameID, Bowler, Score) VALUES
(1, 'John', 167),
(1, 'Susan', 139),
(1, 'Ralph', 95),
(1, 'Mary', 90),
(2, 'Susan', 187),
(2, 'John', 155),
(2, 'Dennis', 100),
(2, 'Anthony', 78);

-- Preview input data
SELECT * FROM scores;


-- Step 3: Rank players per game
WITH ranked AS (
    SELECT
        GameID,
        Bowler,
        Score,
        ROW_NUMBER() OVER (PARTITION BY GameID ORDER BY Score DESC) AS rn
    FROM scores
),
