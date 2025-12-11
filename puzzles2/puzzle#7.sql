-- PUZZLE #7: Permutations 1 through n (here n = 3)
-- Generates all permutations of numbers 1..n and displays the first n positions (i.e. full permutations for n)

-- STEP 0 — BAZA
DROP DATABASE IF EXISTS puzzle7;
CREATE DATABASE puzzle7;
USE puzzle7;


-- STEP 1 — PARAMETER (length n)
DROP TABLE IF EXISTS params;
CREATE TABLE params (
    n INT NOT NULL
);

-- set desired n here
INSERT INTO params (n) VALUES (3);

-- set variable @n from params for convenient usage in CTEs
SELECT n INTO @n FROM params LIMIT 1;
