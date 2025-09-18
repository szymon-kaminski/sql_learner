-- Puzzle #30: Select Star

-- Step 1: Create database and base table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255)
);

INSERT INTO Products VALUES 
(1, 'Keyboard'),
(2, 'Mouse'),
(3, 'Monitor');


-- Step 2: Drop the table structure and replace with a view that disallows SELECT *
DROP VIEW IF EXISTS Products;
CREATE VIEW Products AS
SELECT 
    ProductID AS Product_ID,
    ProductName AS Name
FROM (
    SELECT 1 AS ProductID, 'Keyboard' AS ProductName
    UNION ALL
    SELECT 2, 'Mouse'
    UNION ALL
    SELECT 3, 'Monitor'
) t;


-- Step 3: Test
-- This will FAIL:
-- SELECT * FROM Products;

-- This will WORK:
SELECT Product_ID, Name FROM Products;