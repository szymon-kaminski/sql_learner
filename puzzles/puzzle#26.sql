-- Puzzle #26: Previous Year’s Sales

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS Sales26;
CREATE TABLE Sales26 (
    Year INT,
    Amount DECIMAL(12,2)
);

INSERT INTO Sales26 VALUES
(2018, 352645),
(2017, 165565),
(2017, 254654),
(2016, 159521),
(2016, 251696),
(2016, 111894);

SELECT * FROM Sales26 ORDER BY Year, Amount;


-- Step 2: Aggregate yearly totals
WITH YearlyTotals AS (
    SELECT 
        Year,
        SUM(Amount) AS TotalAmount
    FROM Sales26
    GROUP BY Year
),

