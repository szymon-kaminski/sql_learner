-- Puzzle #23: Divide in Half

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS Players;
CREATE TABLE Players (
    PlayerID INT,
    Score INT
);

INSERT INTO Players (PlayerID, Score) VALUES
(1001, 2343),
(2002, 9432),
(3003, 6548),
(4004, 1054),
(5005, 6832);

SELECT * FROM Players ORDER BY PlayerID, Score;


-- Step 2: Rank players by score
WITH Ranked AS (
    SELECT 
        PlayerID,
        Score,
        ROW_NUMBER() OVER (ORDER BY Score DESC) AS rn,
        COUNT(*) OVER () AS total_count
    FROM Players
)


-- Step 3: Divide players into top and bottom half
SELECT 
    CASE 
        WHEN rn <= total_count / 2 THEN 1
        ELSE 2
    END AS Quartile,
    PlayerID,
    Score
FROM Ranked
ORDER BY Quartile, Score DESC;