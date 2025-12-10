-- PUZZLE #6: Permutations of 0 and 1

-- STEP 0 — BAZA
DROP DATABASE IF EXISTS puzzle6;
CREATE DATABASE puzzle6;
USE puzzle6;


-- STEP 1 — PARAMETER (length n)
DROP TABLE IF EXISTS params;
CREATE TABLE params (
    n INT NOT NULL
);

-- insert desired length here
INSERT INTO params (n) VALUES (3);

-- set variable @n from params for convenient usage in CTEs
SELECT n INTO @n FROM params LIMIT 1;


-- STEP 2 — OUTPUT TABLE
DROP TABLE IF EXISTS permutations;
CREATE TABLE permutations (
    permutation VARCHAR(255) PRIMARY KEY
);


-- STEP 3 — RECURSIVE CTE: build strings by appending '0' and '1' until length = n
WITH RECURSIVE perms AS (
    -- start with empty string of length 0
    SELECT '' AS s, 0 AS len
    UNION ALL
    -- append '0'
    SELECT CONCAT(s, '0'), len + 1
    FROM perms
    WHERE len < @n
    UNION ALL
    -- append '1'
    SELECT CONCAT(s, '1'), len + 1
    FROM perms
    WHERE len < @n
)


-- STEP 4 — INSERT final permutations (only those with length = n)
INSERT INTO permutations (permutation)
SELECT s
FROM perms
WHERE len = @n
ORDER BY s;
