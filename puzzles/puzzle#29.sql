-- Puzzle #29: Count the Groupings

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS Steps29;
CREATE TABLE Steps29 (
    StepNumber INT,
    Status VARCHAR(20)
);

INSERT INTO Steps29 VALUES
(1, 'Passed'),
(2, 'Passed'),
(3, 'Passed'),
(4, 'Passed'),
(5, 'Failed'),
(6, 'Failed'),
(7, 'Failed'),
(8, 'Failed'),
(9, 'Failed'),
(10, 'Passed'),
(11, 'Passed'),
(12, 'Passed');

SELECT * FROM Steps29 ORDER BY StepNumber;


-- Step 2: Mark groups by changes in Status
WITH StatusChanges AS (
    SELECT
        StepNumber,
        Status,
        SUM(
            CASE 
                WHEN Status != LAG(Status) OVER (ORDER BY StepNumber)
                THEN 1 ELSE 0 
            END
        ) OVER (ORDER BY StepNumber) AS grp
    FROM Steps29
),


-- Step 3: Aggregate per group
Grouped AS (
    SELECT
        MIN(StepNumber) AS MinStep,
        MAX(StepNumber) AS MaxStep,
        Status,
        COUNT(*) AS ConsecutiveCount
    FROM StatusChanges
    GROUP BY grp, Status
)


-- Step 4: Return result
SELECT * FROM Grouped ORDER BY MinStep;