-- Puzzle #6: Workflow Steps
-- Cel: Znaleźć workflowy, które zostały rozpoczęte, ale nie zostały ukończone.
-- Bonus: Rozwiązanie wyłącznie z COUNT (bez subqueries).


-- Step 1 — Utworzenie tabeli i danych wejściowych
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