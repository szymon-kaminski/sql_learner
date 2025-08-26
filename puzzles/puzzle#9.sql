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

-- Step 3 — Porównanie licencji między pracownikami
-- Łączymy tabelę samą ze sobą (self-join), aby znaleźć pary pracowników,
-- którzy mają wspólną licencję.
SELECT e1.EmployeeID, e2.EmployeeID AS OtherEmployee, COUNT(*) AS CommonLicenses
FROM EmployeeLicenses e1
JOIN EmployeeLicenses e2
  ON e1.License = e2.License
 AND e1.EmployeeID < e2.EmployeeID
GROUP BY e1.EmployeeID, e2.EmployeeID;
