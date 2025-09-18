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