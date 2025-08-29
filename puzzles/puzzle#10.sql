-- Puzzle #10 — Mean, Median, Mode, and Range

-- Step 1 — Create table and insert data
USE sql_learner;
DROP TABLE IF EXISTS SampleData;

CREATE TABLE SampleData (
    IntegerValue INT
);

INSERT INTO SampleData (IntegerValue) VALUES
(5),(6),(10),(10),(13),
(14),(17),(20),(81),(90),(76);

SELECT * FROM SampleData;

-- Step 2 — Calculate mean and range

SELECT 
    AVG(IntegerValue) AS MeanValue,
    MAX(IntegerValue) - MIN(IntegerValue) AS RangeValue
FROM SampleData;

-- Step 3 — Calculate median using window functions

WITH Ordered AS (
    SELECT 
        IntegerValue,
        ROW_NUMBER() OVER (ORDER BY IntegerValue) AS RowAsc,
        ROW_NUMBER() OVER (ORDER BY IntegerValue DESC) AS RowDesc
    FROM SampleData
)
SELECT 
    AVG(IntegerValue) AS MedianValue
FROM Ordered
WHERE RowAsc = RowDesc
   OR RowAsc + 1 = RowDesc
   OR RowDesc + 1 = RowAsc;