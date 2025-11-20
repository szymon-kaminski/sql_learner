-- Puzzle #73 - Distinct Statuses

-- Step 1: Create table

CREATE TABLE workflow_steps (
StepID INT,
Workflow VARCHAR(50),
Status VARCHAR(50)
);

-- Step 2: Insert sample data
 
INSERT INTO workflow_steps (StepID, Workflow, Status) VALUES
(1, 'Alpha', 'Open'),
(2, 'Alpha', 'Open'),
(3, 'Alpha', 'Inactive'),
(4, 'Alpha', 'Open'),
(5, 'Bravo', 'Closed'),
(6, 'Bravo', 'Closed'),
(7, 'Bravo', 'Open'),
(8, 'Bravo', 'Inactive');

-- Preview input data
SELECT * FROM workflow_steps

-- Step 3: Create ordered CTE assigning row numbers per workflow

WITH ordered AS (
SELECT
StepID,
Workflow,
Status,
ROW_NUMBER() OVER (
PARTITION BY Workflow ORDER BY StepID
) AS rn
FROM workflow_steps
),

-- Step 4: Aggregate unique statuses up to each step

agg AS (
SELECT
o1.StepID,
o1.Workflow,
o1.Status,
COUNT(DISTINCT o2.Status) AS CountDistinct
FROM ordered o1
JOIN ordered o2
ON o1.Workflow = o2.Workflow
AND o2.rn <= o1.rn
GROUP BY
o1.StepID,
o1.Workflow,
o1.Status
)

-- Step 5: Final result output

SELECT
StepID,
Workflow,
Status,
CountDistinct AS Count
FROM agg
ORDER BY StepID;
