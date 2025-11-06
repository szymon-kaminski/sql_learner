-- Puzzle #68: Removing outliers

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS puzzle68;
USE puzzle68;

CREATE TABLE IF NOT EXISTS Scores (
    Team VARCHAR(50),
    Year INT,
    Score INT
);


-- Step 2: Insert data
INSERT INTO Scores (Team, Year, Score) VALUES
('Cougars', 2015, 50),
('Cougars', 2016, 45),
('Cougars', 2017, 65),
('Cougars', 2018, 92),
('Bulldogs', 2015, 65),
('Bulldogs', 2016, 60),
('Bulldogs', 2017, 58),
('Bulldogs', 2018, 12);

-- Preview input data
SELECT * FROM Scores;


-- Step 3: Find average score for each team
WITH team_avg AS (
    SELECT Team, AVG(Score) AS avg_score
    FROM Scores
    GROUP BY Team
),


-- Step 4: Find outlier (score with greatest deviation from average)
deviation AS (
    SELECT 
        s.Team,
        s.Year,
        s.Score,
        ABS(s.Score - t.avg_score) AS deviation,
        RANK() OVER (PARTITION BY s.Team ORDER BY ABS(s.Score - t.avg_score) DESC) AS rnk
    FROM Scores s
    JOIN team_avg t ON s.Team = t.Team
),


-- Step 5: Remove outlier and compute new average
filtered AS (
    SELECT Team, Score
    FROM deviation
    WHERE rnk > 1  -- exclude the single largest deviation
)
SELECT 
    Team,
    ROUND(AVG(Score)) AS Score
FROM filtered
GROUP BY Team
ORDER BY Team;
