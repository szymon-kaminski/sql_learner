-- Puzzle #49 – Sumo Wrestlers

-- Step 1: Setup environment and create table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS SumoWrestlers;
CREATE TABLE SumoWrestlers (
    LineOrder INT,
    Name VARCHAR(50),
    Weight INT
);

INSERT INTO SumoWrestlers (LineOrder, Name, Weight) VALUES
(1, 'Haruto', 611),
(2, 'Minato', 533),
(3, 'Haruki', 623),
(4, 'Sota', 569),
(5, 'Aoto', 610),
(6, 'Hinata', 525);

-- Preview data
SELECT * FROM SumoWrestlers;


-- Step 2: Calculate cumulative weight for each wrestler
WITH Cumulative AS (
    SELECT 
        LineOrder,
        Name,
        Weight,
        SUM(Weight) OVER (ORDER BY LineOrder) AS cumulative_weight
    FROM SumoWrestlers
)


-- Step 3: Select the last wrestler before exceeding 2000 lbs
SELECT 
    Name
FROM Cumulative
WHERE cumulative_weight <= 2000
ORDER BY LineOrder DESC
LIMIT 1;
