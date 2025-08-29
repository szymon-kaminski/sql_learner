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