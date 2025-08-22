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

-- Step 2 — Sprawdzenie danych wejściowych
SELECT * FROM Workflows;

-- Step 3 — Identyfikacja workflowów z brakującym CompletionDate
-- Proste sprawdzenie: które workflowy mają przynajmniej jeden krok NULL
SELECT DISTINCT Workflow
FROM Workflows
WHERE CompletionDate IS NULL;

-- Step 4 — Rozwiązanie z GROUP BY + HAVING (CASE)
SELECT Workflow
FROM Workflows
GROUP BY Workflow
HAVING COUNT(CASE WHEN CompletionDate IS NULL THEN 1 END) > 0;

-- Step 5 — Bonus: tylko COUNT, bez subqueries
-- COUNT(*) liczy wszystkie rekordy,
-- COUNT(CompletionDate) liczy tylko nie-NULL.
-- Jeśli różne → znaczy, że jest przynajmniej jeden NULL.
SELECT Workflow
FROM Workflows
GROUP BY Workflow
HAVING COUNT(*) > COUNT(CompletionDate);