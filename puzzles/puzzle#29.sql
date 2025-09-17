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


-- Step 2: Compute previous status for each row (use LAG once)
WITH Prev AS (
    SELECT
        StepNumber,
        Status,
        LAG(Status) OVER (ORDER BY StepNumber) AS PrevStatus
    FROM Steps29
),


-- Step 3: Mark boundaries (IsNewGroup = 1 when status changes or first row)
Flags AS (
    SELECT
        StepNumber,
        Status,
        CASE WHEN PrevStatus IS NULL OR PrevStatus <> Status THEN 1 ELSE 0 END AS IsNewGroup
    FROM Prev
),


-- Step 4: Number groups by cumulative sum of IsNewGroup
NumberedGroups AS (
    SELECT
        StepNumber,
        Status,
        SUM(IsNewGroup) OVER (ORDER BY StepNumber) AS GroupID
    FROM Flags
)


-- Step 5: Aggregate per group to get min/max step and consecutive count
SELECT
    MIN(StepNumber) AS MinStepNumber,
    MAX(StepNumber) AS MaxStepNumber,
    Status,
    COUNT(*) AS ConsecutiveCount
FROM NumberedGroups
GROUP BY GroupID, Status
ORDER BY MinStepNumber;