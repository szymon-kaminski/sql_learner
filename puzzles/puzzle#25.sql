-- Puzzle #25: Top Vendors

-- Step 1: Create database, table and insert data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Orders25;
CREATE TABLE Orders25 (
    OrderID INT,
    CustomerID INT,
    Vendor VARCHAR(100),
    Cnt INT
);

INSERT INTO Orders25 (OrderID, CustomerID, Vendor, Cnt) VALUES
(1, 1001, 'Vendor A', 12),
(2, 1001, 'Direct Parts', 54),
(3, 1001, 'Direct Parts', 32),
(4, 2002, 'ACME', 7),
(5, 2002, 'ACME', 16),
(6, 2002, 'ACME', 5);

SELECT * FROM Orders25 ORDER BY CustomerID, Vendor;

-- Step 2: Sum orders per customer/vendor
WITH VendorTotals AS (
    SELECT 
        CustomerID,
        Vendor,
        SUM(Cnt) AS TotalOrders
    FROM Orders25
    GROUP BY CustomerID, Vendor
),


-- Step 3: Rank vendors per customer
RankedVendors AS (
    SELECT
        CustomerID,
        Vendor,
        TotalOrders,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY TotalOrders DESC) AS rn
    FROM VendorTotals
)


-- Step 4: Select top vendor per customer
SELECT CustomerID, Vendor, TotalOrders
FROM RankedVendors
WHERE rn = 1
ORDER BY CustomerID;



