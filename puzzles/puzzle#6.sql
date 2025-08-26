-- Puzzle #6: Workflow Steps (MySQL version)
-- Cel: znaleźć workflowy, które zostały rozpoczęte, ale nie zostały w pełni ukończone.


-- Step 1 — Utworzenie tabeli Workflows

USE sql_learner;
DROP TABLE IF EXISTS Workflows;

CREATE TABLE Workflows (
    Workflow VARCHAR(20),
    StepNumber INT,
    CompletionDate DATE
);

INSERT INTO Workflows (Workflow, StepNumber, CompletionDate) VALUES
('Alpha',   1, '2018-07-02'),
('Alpha',   2, '2018-07-02'),
('Alpha',   3, '2018-07-01'),
('Bravo',   1, '2018-06-25'),
('Bravo',   2, NULL),
('Bravo',   3, '2018-06-27'),
('Charlie', 1, NULL),
('Charlie', 2, '2018-07-01');


-- Step 2 — Podgląd danych wejściowych

SELECT * FROM Workflows ORDER BY Workflow, StepNumber;


-- Step 3 — Znalezienie workflowów zaczętych, ale nieukończonych

SELECT Workflow
FROM Workflows
GROUP BY Workflow
HAVING SUM(CASE WHEN CompletionDate IS NOT NULL THEN 1 ELSE 0 END) > 0
   AND SUM(CASE WHEN CompletionDate IS NULL THEN 1 ELSE 0 END) > 0
ORDER BY Workflow;


-- BONUS

SELECT Workflow
FROM Workflows
GROUP BY Workflow
HAVING COUNT(*) > COUNT(CompletionDate);
