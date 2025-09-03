-- Puzzle #16

-- Step 1 — Create table and insert sample data

USE sql_learner;

DROP TABLE IF EXISTS GameScores;
CREATE TABLE GameScores (
    PlayerA INT,
    PlayerB INT,
    Score INT
);

INSERT INTO GameScores (PlayerA, PlayerB, Score) VALUES
(1001, 2002, 150),
(3003, 4004, 15),
(4004, 3003, 125);


-- Step 2 — View raw data

SELECT * FROM GameScores;


-- Step 3 — Normalize pairs (ensure reciprocal players are treated the same)

SELECT 
    LEAST(PlayerA, PlayerB) AS PlayerA,
    GREATEST(PlayerA, PlayerB) AS PlayerB,
    Score
FROM GameScores;


-- Step 4 — Aggregate scores by reciprocal pairs

SELECT 
    LEAST(PlayerA, PlayerB) AS PlayerA,
    GREATEST(PlayerA, PlayerB) AS PlayerB,
    SUM(Score) AS Score
FROM GameScores
GROUP BY LEAST(PlayerA, PlayerB), GREATEST(PlayerA, PlayerB);
