-- Puzzle #31: Second Highest

-- Step 1: Create base table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS SampleData;
CREATE TABLE SampleData (
    IntegerValue INT PRIMARY KEY
);

INSERT INTO SampleData (IntegerValue) VALUES
(3759),(3760),(3761),(3762),(3763);

SELECT * FROM SampleData;


-- Step 2: Solution using MAX subquery
-- Get the maximum value that is less than the global maximum
SELECT MAX(IntegerValue) AS SecondHighest
FROM SampleData
WHERE IntegerValue < (SELECT MAX(IntegerValue) FROM SampleData);


-- Step 3: Solution using ORDER BY + LIMIT/OFFSET
-- Sort descending, skip the first (highest), take the next
SELECT IntegerValue AS SecondHighest
FROM SampleData
ORDER BY IntegerValue DESC
LIMIT 1 OFFSET 1;


-- Step 4: Solution using correlated subquery
-- Count how many values are greater; second highest has exactly 1 greater
SELECT s.IntegerValue AS SecondHighest
FROM SampleData s
WHERE (SELECT COUNT(*) FROM SampleData t WHERE t.IntegerValue > s.IntegerValue) = 1;