-- Puzzle #43 — Unbounded Preceding

-- Step 1: Create table and insert data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Orders43;
CREATE TABLE Orders43 (
    OrderID INT,
    CustomerID INT,
    Quantity INT
);

INSERT INTO Orders43 (OrderID, CustomerID, Quantity) VALUES
(1, 1001, 5),
(2, 1001, 8),
(3, 1001, 3),
(4, 1001, 7),
(1, 2002, 4),
(2, 2002, 9);

-- Preview input
SELECT * FROM Orders43;


-- Step 2: Compute running minimum per CustomerID using window function
SELECT
    OrderID,
    CustomerID,
    Quantity,
    MIN(Quantity) OVER (
        PARTITION BY CustomerID
        ORDER BY OrderID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS MinValue
FROM Orders43
ORDER BY CustomerID, OrderID;
