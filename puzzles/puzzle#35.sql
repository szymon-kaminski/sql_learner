-- Puzzle #35: International vs. Domestic

-- Step 1: Create base table with sales data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Sales35;
CREATE TABLE Sales35 (
    InvoiceID INT PRIMARY KEY,
    SalesRepID INT,
    Amount DECIMAL(10,2),
    SalesType VARCHAR(20)
);

INSERT INTO Sales35 (InvoiceID, SalesRepID, Amount, SalesType) VALUES
(1, 1001, 13454, 'International'),
(2, 2002, 3434, 'International'),
(3, 4004, 54645, 'International'),
(4, 5005, 234345, 'International'),
(5, 7007, 776, 'International'),
(6, 1001, 4564, 'Domestic'),
(7, 2002, 34534, 'Domestic'),
(8, 3003, 345, 'Domestic'),
(9, 6006, 6543, 'Domestic'),
(10, 8008, 67, 'Domestic');

-- Preview input data
SELECT * FROM Sales35;
