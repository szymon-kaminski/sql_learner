-- Puzzle #30: Select Star

-- Step 1: Create base table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS ProductsBase;
CREATE TABLE ProductsBase (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255)
);

INSERT INTO ProductsBase (ProductID, ProductName) VALUES
(1, 'Keyboard'),
(2, 'Mouse'),
(3, 'Monitor');


-- Step 2: Prevent SELECT * misuse
DROP VIEW IF EXISTS Products;
CREATE VIEW Products AS
SELECT ProductID, ProductName
FROM ProductsBase;


-- Step 3: Testing
-- This will FAIL, because SELECT * on Products is blocked (it’s a view only exposing named columns).
-- SELECT * FROM Products;  -- ❌ Error expected

-- This will WORK, because we specify the columns explicitly.
SELECT ProductID, ProductName FROM Products;