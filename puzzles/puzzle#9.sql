-- Puzzle #9 — Matching Sets
-- Cel: dopasować pracowników, którzy mają dokładnie ten sam zestaw licencji.



-- Step 1 — Przygotowanie tabeli

USE sql_learner;
DROP TABLE IF EXISTS EmployeeLicenses;

CREATE TABLE EmployeeLicenses (
    EmployeeID INT,
    License VARCHAR(50)
);