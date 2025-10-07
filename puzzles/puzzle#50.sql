-- Puzzle #50 – Baseball Balls and Strikes

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Pitches;
CREATE TABLE Pitches (
    BatterID INT,
    PitchNumber INT,
    Result VARCHAR(20)
);

INSERT INTO Pitches (BatterID, PitchNumber, Result) VALUES
(1001, 1, 'Foul'),
(1001, 2, 'Foul'),
(1001, 3, 'Ball'),
(1001, 4, 'Ball'),
(1001, 5, 'Strike'),
(2002, 1, 'Ball'),
(2002, 2, 'Strike'),
(2002, 3, 'Foul'),
(2002, 4, 'Foul'),
(2002, 5, 'Foul'),
(2002, 6, 'In Play'),
(3003, 1, 'Ball'),
(3003, 2, 'Ball'),
(3003, 3, 'Ball'),
(3003, 4, 'Ball'),
(4004, 1, 'Foul'),
(4004, 2, 'Foul'),
(4004, 3, 'Foul'),
(4004, 4, 'Foul'),
(4004, 5, 'Foul'),
(4004, 6, 'Strike');

-- Preview data
SELECT * FROM Pitches;


-- Step 2: Calculate running totals for balls and strikes
WITH Counts AS (
    SELECT
        BatterID,
        PitchNumber,
        Result,
        SUM(CASE WHEN Result = 'Ball' THEN 1 ELSE 0 END)
            OVER (PARTITION BY BatterID ORDER BY PitchNumber) AS total_balls,
        SUM(CASE 
                WHEN Result IN ('Strike', 'Foul') THEN 1 
                ELSE 0 
            END)
            OVER (PARTITION BY BatterID ORDER BY PitchNumber) AS total_strikes
    FROM Pitches
)


-- Step 3: Compute Start and End of Pitch Counts
SELECT
    BatterID,
    PitchNumber,
    Result,
    CONCAT(
        COALESCE(LAG(total_balls) OVER (PARTITION BY BatterID ORDER BY PitchNumber), 0),
        ' - ',
        COALESCE(LAG(total_strikes) OVER (PARTITION BY BatterID ORDER BY PitchNumber), 0)
    ) AS StartOfPitchCount,
    CASE 
        WHEN Result = 'In Play' THEN 'In-Play'
        ELSE CONCAT(total_balls, ' - ', total_strikes)
    END AS EndOfPitchCount
FROM Counts
ORDER BY BatterID, PitchNumber;
