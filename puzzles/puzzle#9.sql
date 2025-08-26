-- Puzzle #9 — Matching Sets
-- Cel: dopasować pracowników, którzy mają dokładnie ten sam zestaw licencji.



-- Step 1 — Przygotowanie tabeli

USE sql_learner;
DROP TABLE IF EXISTS EmployeeLicenses;

CREATE TABLE EmployeeLicenses (
    EmployeeID INT,
    License VARCHAR(50)
);

-- Step 2 — Wstawienie danych

INSERT INTO EmployeeLicenses (EmployeeID, License) VALUES
(1001, 'Class A'),
(1001, 'Class B'),
(1001, 'Class C'),
(2002, 'Class A'),
(2002, 'Class B'),
(2002, 'Class C'),
(3003, 'Class A'),
(3003, 'Class D'),
(4004, 'Class A'),
(4004, 'Class B'),
(4004, 'Class D'),
(5005, 'Class A'),
(5005, 'Class B'),
(5005, 'Class D');

-- Podgląd tabeli
SELECT * FROM EmployeeLicenses;
