-- Puzzle #2: All Permutations

-- Step 1: Create database
CREATE DATABASE IF NOT EXISTS puzzle2;
USE puzzle2;


-- Step 2: Drop old table
DROP TABLE IF EXISTS permutations;


-- Step 3: Create output table
CREATE TABLE permutations (
    MaxNumber INT,
    Permutation VARCHAR(50)
);


-- Step 4: Generate all permutations for n = 3 (recursive CTE)
Ten CTE generuje permutacje na zasadzie:
•	zaczynasz od pustej sekwencji
•	dokładasz każdą liczbę, która jeszcze nie została użyta
WITH RECURSIVE cte AS (
    -- start: empty sequence
    SELECT
        '' AS seq,
        '' AS used,
        3 AS maxn
    UNION ALL
    -- recursive: append number not yet used
    SELECT
        CONCAT(seq, CASE WHEN seq = '' THEN '' ELSE ',' END, n) AS seq,
        CONCAT(used, n) AS used,
        maxn
    FROM cte
    JOIN (
        SELECT 1 AS n UNION SELECT 2 UNION SELECT 3
    ) nums
    ON INSTR(used, nums.n) = 0
)
SELECT maxn AS MaxNumber, seq AS Permutation
FROM cte
WHERE LENGTH(used) = maxn       -- full permutations only
ORDER BY seq;


-- Step 5: Insert permutations into table
WITH RECURSIVE cte AS (
    SELECT '' AS seq, '' AS used, 3 AS maxn
    UNION ALL
    SELECT
        CONCAT(seq, CASE WHEN seq = '' THEN '' ELSE ',' END, n),
        CONCAT(used, n),
        maxn
    FROM cte
    JOIN (
        SELECT 1 AS n UNION SELECT 2 UNION SELECT 3
    ) nums ON INSTR(used, nums.n) = 0
)
INSERT INTO permutations (MaxNumber, Permutation)
SELECT maxn, seq
FROM cte
WHERE LENGTH(used) = maxn;
