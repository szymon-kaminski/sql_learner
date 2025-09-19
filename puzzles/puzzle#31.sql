-- Puzzle #31: Second Highest

-- Step 1: Create base table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS SampleData;
CREATE TABLE SampleData (
    IntegerValue INT PRIMARY KEY
);

INSERT INTO SampleData (IntegerValue) VALUES
(3759),(3760),(3761),(3762),(3763);

SELECT * FROM SampleData;