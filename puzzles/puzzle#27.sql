-- Puzzle #27: Delete the Duplicates

-- Step 1: Create table and insert data
DROP TABLE IF EXISTS SampleData;
CREATE TABLE SampleData (
    IntegerValue INT
);

INSERT INTO SampleData VALUES
(1),(1),(2),(3),(3),(4);