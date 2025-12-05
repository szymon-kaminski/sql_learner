-- Puzzle #4: Non-Adjacent Numbers
-- Generate all permutations of {1,2,3,4}
-- where no adjacent numbers differ by 1


-- STEP 1: Create database
CREATE DATABASE IF NOT EXISTS puzzle4;
USE puzzle4;


-- STEP 2: Drop old table
DROP TABLE IF EXISTS non_adjacent;


-- STEP 3: Create output table
CREATE TABLE non_adjacent (
    Permutation VARCHAR(50)
);


-- STEP 4: Preview valid non-adjacent permutations (FINAL FIX)
WITH RECURSIVE cte AS (
    SELECT 
        CAST('' AS CHAR(50)) AS seq,
        CAST('' AS CHAR(50)) AS used
    UNION ALL
    SELECT
        CONCAT(seq, CASE WHEN seq = '' THEN '' ELSE ',' END, n.n),
        CONCAT(used, n.n)
    FROM cte
    JOIN (
        SELECT 1 AS n UNION
        SELECT 2 UNION
        SELECT 3 UNION
        SELECT 4
    ) n
      ON INSTR(used, n.n) = 0
     AND (
          seq = ''
          OR ABS(
                CAST(SUBSTRING_INDEX(seq, ',', -1) AS SIGNED)
                -
                CAST(n.n AS SIGNED)
          ) <> 1
     )
)
SELECT seq AS Permutation
FROM cte
WHERE LENGTH(used) = 4
ORDER BY seq;


-- STEP 5: Insert valid permutations into the table (FINAL FIX)
WITH RECURSIVE cte AS (
    SELECT 
        CAST('' AS CHAR(50)) AS seq,
        CAST('' AS CHAR(50)) AS used
    UNION ALL
    SELECT
        CONCAT(seq, CASE WHEN seq = '' THEN '' ELSE ',' END, n.n),
        CONCAT(used, n.n)
    FROM cte
    JOIN (
        SELECT 1 AS n UNION
        SELECT 2 UNION
        SELECT 3 UNION
        SELECT 4
    ) n
      ON INSTR(used, n.n) = 0
     AND (
          seq = ''
          OR ABS(
                CAST(SUBSTRING_INDEX(seq, ',', -1) AS SIGNED)
                -
                CAST(n.n AS SIGNED)
          ) <> 1
     )
)
INSERT INTO non_adjacent (Permutation)
SELECT seq
FROM cte
WHERE LENGTH(used) = 4;

