-- Puzzle #11 — Permutations

-- Step 1 — Create table and insert test cases
Create TestCases table and insert values for Puzzle #11
USE sql_learner;
DROP TABLE IF EXISTS TestCases;

CREATE TABLE TestCases (
    Value CHAR(1)
);

INSERT INTO TestCases (Value) VALUES
('A'),('B'),('C');

SELECT * FROM TestCases;