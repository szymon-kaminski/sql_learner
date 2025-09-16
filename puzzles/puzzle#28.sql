-- Puzzle #28: Fill the Gaps

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS WorkflowLogs;
CREATE TABLE WorkflowLogs (
    RowNumber INT,
    Workflow VARCHAR(50),
    Status VARCHAR(50)
);

INSERT INTO WorkflowLogs (RowNumber, Workflow, Status) VALUES
(1, 'Alpha', NULL),
(2, NULL, 'Pass'),
(3, NULL, 'Fail'),
(4, NULL, 'Fail'),
(5, 'Bravo', NULL),
(6, NULL, 'Pass'),
(7, NULL, 'Fail'),
(8, NULL, 'Fail'),
(9, NULL, 'Pass'),
(10,'Charlie', NULL),
(11,NULL, 'Fail'),
(12,NULL, 'Fail');

-- Podgląd danych wejściowych
SELECT * FROM WorkflowLogs ORDER BY RowNumber;