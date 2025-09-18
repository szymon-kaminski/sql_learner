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
