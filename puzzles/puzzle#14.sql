-- Puzzle #14

-- Step 1 — Create the table and insert data

USE sql_learner;

DROP TABLE IF EXISTS ProcessLog;
CREATE TABLE ProcessLog (
    Workflow VARCHAR(50),
    StepNumber INT,
    Status VARCHAR(20)
);

INSERT INTO ProcessLog (Workflow, StepNumber, Status)
VALUES
('Alpha',   1, 'Error'),
('Alpha',   2, 'Complete'),
('Alpha',   3, 'Complete'),
('Bravo',   1, 'Running'),
('Bravo',   2, 'Complete'),
('Charlie', 1, 'Complete'),
('Charlie', 2, 'Running'),
('Delta',   1, 'Running'),
('Delta',   2, 'Error'),
('Echo',    1, 'Error'),
('Echo',    2, 'Running');


-- Step 2 — View raw process log

SELECT * FROM ProcessLog;


-- Step 3 — Aggregate per workflow and count status types

SELECT 
    Workflow,
    SUM(CASE WHEN Status = 'Error' THEN 1 ELSE 0 END) AS ErrorCount,
    SUM(CASE WHEN Status = 'Complete' THEN 1 ELSE 0 END) AS CompleteCount,
    SUM(CASE WHEN Status = 'Running' THEN 1 ELSE 0 END) AS RunningCount
FROM ProcessLog
GROUP BY Workflow;


-- Step 4 — Apply business rules to determine overall status

SELECT
    Workflow,
    CASE
        -- All Error
        WHEN ErrorCount > 0 AND CompleteCount = 0 AND RunningCount = 0 THEN 'Error'
        -- All Complete
        WHEN CompleteCount > 0 AND ErrorCount = 0 AND RunningCount = 0 THEN 'Complete'
        -- All Running
        WHEN RunningCount > 0 AND ErrorCount = 0 AND CompleteCount = 0 THEN 'Running'
        -- Error + (Complete or Running) → Indeterminate
        WHEN ErrorCount > 0 AND (CompleteCount > 0 OR RunningCount > 0) THEN 'Indeterminate'
        -- Complete + Running → Running
        WHEN CompleteCount > 0 AND RunningCount > 0 AND ErrorCount = 0 THEN 'Running'
    END AS Status
FROM (
    SELECT 
        Workflow,
        SUM(CASE WHEN Status = 'Error' THEN 1 ELSE 0 END) AS ErrorCount,
        SUM(CASE WHEN Status = 'Complete' THEN 1 ELSE 0 END) AS CompleteCount,
        SUM(CASE WHEN Status = 'Running' THEN 1 ELSE 0 END) AS RunningCount
    FROM ProcessLog
    GROUP BY Workflow
) AS Counts;