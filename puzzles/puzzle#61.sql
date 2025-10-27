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

--Step 2: Wstawienie danych testowych
INSERT INTO PlayerScores (AttemptID, PlayerID, Score) VALUES
(1, 1001, 2),
(2, 1001, 7),
(3, 1001, 8),
(1, 2002, 6),
(2, 2002, 9),
(3, 2002, 7);
-- Preview data
SELECT * FROM PlayerScores;

-- Step 3: Wyliczenie różnicy względem pierwszego i poprzedniego wyniku
SELECT 
    AttemptID,
    PlayerID,
    Score,
    Score - FIRST_VALUE(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) AS Difference_First,
    Score - LAG(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) AS Difference_Last
FROM PlayerScores;
