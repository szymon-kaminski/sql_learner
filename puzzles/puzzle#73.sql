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