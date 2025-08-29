-- Puzzle #11 — Permutations

-- Step 1 — Create table and insert test cases

USE sql_learner;
DROP TABLE IF EXISTS TestCases;

CREATE TABLE TestCases (
    Value CHAR(1)
);

INSERT INTO TestCases (Value) VALUES
('A'),('B'),('C');

SELECT * FROM TestCases;

-- Step 2 — Generate permutations using self-joins

SELECT 
    CONCAT(t1.Value, ',', t2.Value, ',', t3.Value) AS TestCases
FROM TestCases t1
JOIN TestCases t2 ON t1.Value <> t2.Value
JOIN TestCases t3 ON t1.Value <> t3.Value AND t2.Value <> t3.Value;

-- Step 3 — Generalize solution (dynamic size with GROUP_CONCAT)
-- NOTE: This approach relies on MySQL’s GROUP_CONCAT and can handle 
--       variable input size by combining rows dynamically.
SELECT GROUP_CONCAT(Value ORDER BY Value) AS Combined
FROM TestCases;