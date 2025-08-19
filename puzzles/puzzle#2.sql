-- Puzzle #2: Managers and Employees

-- Step 1: Create table and insert sample data
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    ManagerID INT,
    JobTitle VARCHAR(50)
);

INSERT INTO Employees (EmployeeID, ManagerID, JobTitle) VALUES
(1001, NULL, 'President'),
(2002, 1001, 'Director'),
(3003, 1001, 'Office Manager'),
(4004, 2002, 'Engineer'),
(5005, 2002, 'Engineer'),
(6006, 2002, 'Engineer');

-- Step 2: Base case - select the President with dept = 0
WITH RECURSIVE EmployeeHierarchy AS (
    SELECT
        EmployeeID,
        ManagerID,
        JobTitle,
        0 AS Depth
    FROM Employees
    WHERE JobTitle = 'President'
);

SELECT * FROM EmployeeHierarchy;