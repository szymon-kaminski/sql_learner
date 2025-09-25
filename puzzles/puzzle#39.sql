-- Puzzle #39 — Prime Numbers

-- Step 1: Create table with input data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

CREATE TABLE PrimeNumbers (
    IntegerValue INTEGER PRIMARY KEY
);

INSERT INTO PrimeNumbers (IntegerValue) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

-- Preview input data
SELECT * FROM PrimeNumbers ORDER BY IntegerValue;


-- Step 2: Logika znajdowania liczb pierwszych
SELECT p.IntegerValue
FROM PrimeNumbers p
WHERE p.IntegerValue > 1
  AND NOT EXISTS (
    SELECT 1
    FROM PrimeNumbers d
    WHERE d.IntegerValue > 1
      AND d.IntegerValue < p.IntegerValue
      AND p.IntegerValue % d.IntegerValue = 0
  );
