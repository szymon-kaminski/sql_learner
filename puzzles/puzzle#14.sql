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