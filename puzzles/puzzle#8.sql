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