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