-- Puzzle #34: Specific Exclusion

-- Step 1: Create base table with sample data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Orders34;
CREATE TABLE Orders34 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Amount DECIMAL(10,2)
);

INSERT INTO Orders34 (OrderID, CustomerID, Amount) VALUES
(1, 1001, 25.00),
(2, 1001, 50.00),
(3, 2002, 65.00),
(4, 3003, 50.00);

-- Preview input data
SELECT * FROM Orders34;
