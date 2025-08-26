-- Puzzle #2: Managers and Employees (MySQL version)
-- Cel: policzyć głębokość (depth) każdego pracownika względem prezesa.


-- Step 1 — Utworzenie tabeli z danymi wejściowymi

USE sql_learner;
DROP TABLE IF EXISTS Employees;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    ManagerID INT NULL,
    JobTitle VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) VALUES
(1001, NULL, 'President'),
(2002, 1001, 'Director'),
(3003, 1001, 'Office Manager'),
(4004, 2002, 'Engineer'),
(5005, 2002, 'Engineer'),
(6006, 2002, 'Engineer');


-- Step 2 — Podgląd danych wejściowych

SELECT * FROM Employees ORDER BY EmployeeID;


-- Step 3 — Rekurencyjne CTE do policzenia depth

WITH RECURSIVE EmployeeHierarchy AS (
    -- punkt startowy: prezes (depth = 0)
    SELECT 
        EmployeeID,
        ManagerID,
        JobTitle,
        0 AS Depth
    FROM Employees
    WHERE JobTitle = 'President'

    UNION ALL

    -- rekurencja: dodajemy pracowników pod managerem
    SELECT 
        e.EmployeeID,
        e.ManagerID,
        e.JobTitle,
        eh.Depth + 1 AS Depth
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh ON e.ManagerID = eh.EmployeeID
)
SELECT EmployeeID, ManagerID, JobTitle, Depth
FROM EmployeeHierarchy
ORDER BY EmployeeID;
