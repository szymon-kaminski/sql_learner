-- Puzzle #55 - Table Audit

-- Step 1: Add ProductsA and ProductsB tables with sample data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS ProductsA;
DROP TABLE IF EXISTS ProductsB;

CREATE TABLE ProductsA (
    ProductName VARCHAR(50),
    Quantity INT
);

CREATE TABLE ProductsB (
    ProductName VARCHAR(50),
    Quantity INT
);

INSERT INTO ProductsA VALUES
('Widget', 7),
('Doodad', 9),
('Gizmo', 3);

INSERT INTO ProductsB VALUES
('Widget', 7),
('Doodad', 6),
('Dingbat', 9);

-- preview data
SELECT * FROM ProductsA;
SELECT * FROM ProductsB;


-- Step 2: Combine data from both tables (simulate FULL OUTER JOIN)
WITH Combined AS (
    SELECT 
        a.ProductName AS ProductA,
        a.Quantity AS QuantityA,
        b.ProductName AS ProductB,
        b.Quantity AS QuantityB
    FROM ProductsA a
    LEFT JOIN ProductsB b
        ON a.ProductName = b.ProductName

    UNION

    SELECT 
        a.ProductName AS ProductA,
        a.Quantity AS QuantityA,
        b.ProductName AS ProductB,
        b.Quantity AS QuantityB
    FROM ProductsA a
    RIGHT JOIN ProductsB b
        ON a.ProductName = b.ProductName
)
