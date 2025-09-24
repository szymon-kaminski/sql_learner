-- Puzzle #37: Group Criteria Keys

-- Step 1: Create base table with orders
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Orders37;
CREATE TABLE Orders37 (
    OrderID INT PRIMARY KEY,
    Distributor VARCHAR(50),
    Facility INT,
    Zone VARCHAR(10),
    Amount DECIMAL(10,2)
);

INSERT INTO Orders37 (OrderID, Distributor, Facility, Zone, Amount) VALUES
(1, 'ACME', 123, 'ABC', 100.00),
(2, 'ACME', 123, 'ABC', 75.00),
(3, 'Direct Parts', 789, 'XYZ', 150.00),
(4, 'Direct Parts', 789, 'XYZ', 125.00);

-- Preview input data
SELECT * FROM Orders37;

