-- Puzzle #20

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS ProductPrices;
CREATE TABLE ProductPrices (
    ProductID INT,
    EffectiveDate DATE,
    UnitPrice DECIMAL(10,2)
);

INSERT INTO ProductPrices (ProductID, EffectiveDate, UnitPrice) VALUES
(1001, '2018-01-01', 1.99),
(1001, '2018-04-15', 2.99),
(1001, '2018-06-08', 2.99),
(2002, '2018-04-17', 3.99),
(2002, '2018-05-19', 1.99);


-- Step 2: Add row numbers per product (latest price = rn = 1)
WITH RankedPrices AS (
    SELECT 
        ProductID,
        EffectiveDate,
        UnitPrice,
        ROW_NUMBER() OVER (
            PARTITION BY ProductID
            ORDER BY EffectiveDate DESC
        ) AS rn
    FROM ProductPrices
)