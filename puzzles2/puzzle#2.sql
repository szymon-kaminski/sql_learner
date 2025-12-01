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

-- Step 4: Show permutations (SELECT)
WITH RECURSIVE cte AS (
    SELECT 
        CAST('' AS CHAR(50)) AS seq,
        CAST('' AS CHAR(10)) AS used,
        3 AS maxn
    UNION ALL
    SELECT
        CONCAT(seq, CASE WHEN seq = '' THEN '' ELSE ',' END, nums.n),
        CONCAT(used, nums.n),
        maxn
    FROM cte
    JOIN (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3) nums
      ON INSTR(used, nums.n) = 0
)
SELECT maxn AS MaxNumber, seq AS Permutation
FROM cte
WHERE LENGTH(used) = maxn
ORDER BY seq;

-- Step 5: Insert into table (no blank lines here!)
WITH RECURSIVE cte AS (
    SELECT 
        CAST('' AS CHAR(50)) AS seq,
        CAST('' AS CHAR(10)) AS used,
        3 AS maxn
    UNION ALL
    SELECT
        CONCAT(seq, CASE WHEN seq = '' THEN '' ELSE ',' END, nums.n),
        CONCAT(used, nums.n),
        maxn
    FROM cte
    JOIN (SELECT 1 AS n UNION SELECT 2 UNION SELECT 3) nums
      ON INSTR(used, nums.n) = 0
)
INSERT INTO permutations (MaxNumber, Permutation)
SELECT maxn, seq
FROM cte
WHERE LENGTH(used) = maxn;
