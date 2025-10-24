-- Puzzle #60 — Products Without Duplicates

-- STEP 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Products;

CREATE TABLE Products (
    Product VARCHAR(50),
    ProductCode VARCHAR(10)
);


-- STEP 2: Insert example data
INSERT INTO Products (Product, ProductCode) VALUES
('Alpha', '01'),
('Alpha', '02'),
('Bravo', '03'),
('Bravo', '04'),
('Charlie', '02'),
('Delta', '01'),
('Echo', 'EE'),
('Foxtrot', 'EE'),
('Gulf', 'GG');

-- Preview data
SELECT * FROM Products;
