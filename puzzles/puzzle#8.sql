-- Puzzle #8: Workflow Cases (MySQL version)
-- Cel: policzyć liczbę „zdań testów” (1) w każdym workflow.

------------------------------------------------------------
-- Step 1 — Utworzenie tabeli WorkflowsCases
------------------------------------------------------------
DROP TABLE IF EXISTS WorkflowCases;

CREATE TABLE WorkflowCases (
    Workflow VARCHAR(20),
    Case1 INT,
    Case2 INT,
    Case3 INT
);

------------------------------------------------------------
-- Step 2 — Wstawienie danych
------------------------------------------------------------
INSERT INTO WorkflowCases (Workflow, Case1, Case2, Case3) VALUES
('Alpha',   0, 0, 0),
('Bravo',   0, 1, 1),
('Charlie', 1, 0, 0),
('Delta',   0, 0, 0);

------------------------------------------------------------
-- Step 3 — Podgląd danych wejściowych
------------------------------------------------------------
SELECT * FROM WorkflowCases;

------------------------------------------------------------
-- Step 4 — Obliczenie kolumny Passed
------------------------------------------------------------
SELECT 
    Workflow,
    (Case1 + Case2 + Case3) AS Passed
FROM WorkflowCases
ORDER BY Workflow;