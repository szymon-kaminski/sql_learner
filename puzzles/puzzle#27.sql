-- Puzzle #27: Delete the Duplicates

-- Step 1: Create table and insert data
DROP TABLE IF EXISTS SampleData;
CREATE TABLE SampleData (
    IntegerValue INT
);

INSERT INTO SampleData VALUES
(1),(1),(2),(3),(3),(4);


-- Step 2: Show initial data
SELECT * FROM SampleData;


-- Step 3: Delete duplicates, keeping only one occurrence of each value
DELETE sd
FROM SampleData sd
JOIN (
    SELECT 
        IntegerValue,
        ROW_NUMBER() OVER (PARTITION BY IntegerValue ORDER BY IntegerValue) AS rn
    FROM SampleData
) t ON sd.IntegerValue = t.IntegerValue AND t.rn > 1;