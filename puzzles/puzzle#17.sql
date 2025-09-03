-- Puzzle #17

-- Step 1 — Create table and insert sample data

USE sql_learner;

DROP TABLE IF EXISTS Products;
CREATE TABLE Products (
    Product VARCHAR(50),
    Quantity INT
);

INSERT INTO Products (Product, Quantity) VALUES
('Pencil', 3),
('Eraser', 4),
('Notebook', 2);


-- Step 2 — View raw data

SELECT * FROM Products;


-- Step 3 — Generate a sequence of numbers (tally table) 
-- MySQL trick: use a derived table with UNION ALL

SELECT n FROM (
    SELECT 1 AS n UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5
) AS numbers;


-- Step 4 — De-group: expand each product by joining with sequence

SELECT 
    p.Product,
    1 AS Quantity
FROM Products p
JOIN (
    SELECT 1 AS n UNION ALL
    SELECT 2 UNION ALL
    SELECT 3 UNION ALL
    SELECT 4 UNION ALL
    SELECT 5
) nums
  ON nums.n <= p.Quantity
ORDER BY p.Product;