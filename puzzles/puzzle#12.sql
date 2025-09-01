-- Puzzle #12

-- Step 1 — Create table and insert sample data

USE sql_learner;

DROP TABLE IF EXISTS WorkflowExecutions;

CREATE TABLE WorkflowExecutions (
    Workflow VARCHAR(50),
    ExecutionDate DATE
);

INSERT INTO WorkflowExecutions (Workflow, ExecutionDate)
VALUES
('Alpha', '2018-06-01'),
('Alpha', '2018-06-14'),
('Alpha', '2018-06-15'),
('Bravo', '2018-06-01'),
('Bravo', '2018-06-02'),
('Bravo', '2018-06-19'),
('Charlie', '2018-06-01'),
('Charlie', '2018-06-15'),
('Charlie', '2018-06-30');
