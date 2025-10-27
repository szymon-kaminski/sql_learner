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
-- SELECT 
   -- AttemptID,
   -- PlayerID,
   -- Score,
   -- Score - FIRST_VALUE(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) AS Difference_First,
   -- Score - LAG(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) AS Difference_Last
-- FROM PlayerScores;

-- Step 4: Dodanie flagi — czy bieżący wynik jest lepszy od poprzedniego?
SELECT 
    AttemptID,
    PlayerID,
    Score,
    Score - FIRST_VALUE(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) AS Difference_First,
    COALESCE(Score - LAG(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID), 0) AS Difference_Last,
    CASE 
        WHEN LAG(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) IS NULL THEN 1
        WHEN Score > LAG(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) THEN 1
        ELSE 0
    END AS Is_Previous_Score_Lower
FROM PlayerScores;


-- Step 5: Oznaczenie graczy, którzy poprawiali się we wszystkich próbach
WITH ScoreFlags AS (
    SELECT 
        PlayerID,
        AttemptID,
        Score,
        Score - FIRST_VALUE(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) AS Difference_First,
        COALESCE(Score - LAG(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID), 0) AS Difference_Last,
        CASE 
            WHEN LAG(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) IS NULL THEN 1
            WHEN Score > LAG(Score) OVER (PARTITION BY PlayerID ORDER BY AttemptID) THEN 1
            ELSE 0
        END AS Is_Previous_Score_Lower
    FROM PlayerScores
)
SELECT 
    AttemptID,
    PlayerID,
    Score,
    Difference_First,
    Difference_Last,
    Is_Previous_Score_Lower,
    CASE 
        WHEN SUM(Is_Previous_Score_Lower) OVER (PARTITION BY PlayerID) = COUNT(*) OVER (PARTITION BY PlayerID)
        THEN 1 ELSE 0
    END AS Is_Overall_Improved
FROM ScoreFlags
ORDER BY PlayerID, AttemptID;

