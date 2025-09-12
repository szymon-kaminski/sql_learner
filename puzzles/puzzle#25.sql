--Puzzle #25 - Top Vendors

-- Step 1 - utworzenie tabeli i danych
USE sql_learner;

DROP TABLE IF EXISTS Orders25;
CREATE TABLE Orders25 (
    OrderID INT,
    CustomerID INT,
    Vendor VARCHAR(50),
    Cnt INT
);

INSERT INTO Orders25 VALUES
(1, 1001, 'Vendor A', 12),
(2, 1001, 'Direct Parts', 54),
(3, 1001, 'Direct Parts', 32),
(4, 2002, 'ACME', 7),
(5, 2002, 'ACME', 16),
(6, 2002, 'ACME', 5);


-- Step 2 - sumujemy zamówienia per Customer + Vendor
WITH VendorTotals AS (
    SELECT 
        CustomerID,
        Vendor,
        SUM(Cnt) AS TotalOrders
    FROM Orders25
    GROUP BY CustomerID, Vendor
)
SELECT * FROM VendorTotals;

