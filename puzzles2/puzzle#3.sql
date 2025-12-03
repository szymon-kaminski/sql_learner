-- Puzzle #3: Growing Numbers

-- STEP 1: Create database
CREATE DATABASE IF NOT EXISTS puzzle3;
USE puzzle3;


-- STEP 2: Drop old table
DROP TABLE IF EXISTS growing;


-- STEP 3: Create table
CREATE TABLE growing (
    Permutation VARCHAR(50)
);


-- STEP 4: Insert generated growing sequences using a single recursive CTE (n = 5)
WITH RECURSIVE cte AS (
    SELECT 1 AS n, CAST('1' AS CHAR(50)) AS seq
    UNION ALL
    SELECT n + 1, CONCAT(seq, n + 1)
    FROM cte
    WHERE n < 5
)
INSERT INTO growing (Permutation)
SELECT seq FROM cte;

-- STEP 5: Preview final table
SELECT * FROM growing ORDER BY LENGTH(Permutation);
