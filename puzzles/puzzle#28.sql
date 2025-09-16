-- Puzzle #28: Fill the Gaps

-- Step 1: Create database, table and insert data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Workflows;
CREATE TABLE Workflows (
    RowNumber INT,
    Workflow VARCHAR(20),
    Status VARCHAR(20)
);

INSERT INTO Workflows (RowNumber, Workflow, Status) VALUES
(1, 'Alpha', NULL),
(2, NULL, 'Pass'),
(3, NULL, 'Fail'),
(4, NULL, 'Fail'),
(5, 'Bravo', NULL),
(6, NULL, 'Pass'),
(7, NULL, 'Fail'),
(8, NULL, 'Fail'),
(9, NULL, 'Pass'),
(10, 'Charlie', NULL),
(11, NULL, 'Fail'),
(12, NULL, 'Fail');

-- Step 2: Preview initial data
SELECT * FROM Workflows ORDER BY RowNumber;

-- Step 3: Fill missing Workflow values with last non-null Workflow
SELECT 
    w.RowNumber,
    COALESCE(w.Workflow, (
        SELECT w2.Workflow
        FROM Workflows w2
        WHERE w2.Workflow IS NOT NULL
          AND w2.RowNumber < w.RowNumber
        ORDER BY w2.RowNumber DESC
        LIMIT 1
    )) AS Workflow,
    w.Status
FROM Workflows w
ORDER BY w.RowNumber;
