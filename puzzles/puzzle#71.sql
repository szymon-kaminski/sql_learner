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


-- Step 2 - Insert sample data
INSERT INTO Employees VALUES
(1001, 'John'),
(2002, 'Eric'),
(3003, 'Jennifer'),
(4004, 'Bob'),
(5005, 'Stuart'),
(6006, 'Angie');

INSERT INTO TemporaryEmployees VALUES
(1001, 'Engineering'),
(2002, 'Sales'),
(3003, 'Marketing');

INSERT INTO PermanentEmployees VALUES
(4004, 'Marketing'),
(5005, 'Accounting'),
(6006, 'Accounting');


-- Step 3: Trigger - Temp must reference Employees

DELIMITER //
CREATE TRIGGER trg_temp_check_employee_exists
BEFORE INSERT ON TemporaryEmployees
FOR EACH ROW
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM Employees WHERE EmployeeID = NEW.EmployeeID
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Employee does not exist in Employees table.';
    END IF;
END//
DELIMITER ;
