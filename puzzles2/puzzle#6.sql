-- PUZZLE #6: Permutations of 0 and 1

-- STEP 0 — BAZA
DROP DATABASE IF EXISTS puzzle6;
CREATE DATABASE puzzle6;
USE puzzle6;

-- STEP 1 — PARAMETER
DROP TABLE IF EXISTS params;
CREATE TABLE params (
    n INT NOT NULL
);

INSERT INTO params (n) VALUES (3);
SELECT n INTO @n FROM params LIMIT 1;

-- STEP 2 — OUTPUT TABLE
DROP TABLE IF EXISTS permutations;
CREATE TABLE permutations (
    permutation VARCHAR(255) PRIMARY KEY
);

-- STEP 3 — RECURSIVE CTE with CAST to avoid "Data too long"
INSERT INTO permutations (permutation)
SELECT s
FROM (
    WITH RECURSIVE perms AS (
        SELECT CAST('' AS CHAR(255)) AS s,
               0 AS len
        UNION ALL
        SELECT CONCAT(s, '0'), len + 1
        FROM perms
        WHERE len < @n
        UNION ALL
        SELECT CONCAT(s, '1'), len + 1
        FROM perms
        WHERE len < @n
    )
    SELECT s
    FROM perms
    WHERE len = @n
) AS x
ORDER BY s;

-- STEP 4 — PODGLĄD
SELECT * FROM permutations ORDER BY permutation;
