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


-- STEP 4: Preview valid non-adjacent permutations using recursive CTE
WITH RECURSIVE cte AS (
    -- Start with empty sequence
    SELECT 
        '' AS seq,
        '' AS used
    UNION ALL
    -- Add next number if:
    -- 1) it was not used yet
    -- 2) it is NOT adjacent to the previous number
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
                CAST(SUBSTRING_INDEX(seq, ',', -1) AS UNSIGNED) - n.n
          ) <> 1
     )
)
SELECT seq AS Permutation
FROM cte
WHERE LENGTH(used) = 4
ORDER BY seq;
