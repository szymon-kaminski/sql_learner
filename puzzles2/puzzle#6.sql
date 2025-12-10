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
