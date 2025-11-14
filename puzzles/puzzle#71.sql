-- Puzzle #71 - Employee Validation (Full Solution)

-- Step 1 - Create schema & tables
CREATE DATABASE puzzle71;
USE puzzle71;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50)
);

CREATE TABLE TemporaryEmployees (
    EmployeeID INT PRIMARY KEY,
    Department VARCHAR(50)
);

CREATE TABLE PermanentEmployees (
    EmployeeID INT PRIMARY KEY,
    Department VARCHAR(50)
);
