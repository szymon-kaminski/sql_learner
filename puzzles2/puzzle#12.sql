-- Puzzle #12 - Double or Add 1

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle12;
CREATE DATABASE puzzle12;
USE puzzle12;


-- STEP 1 - OUTPUT TABLE
CREATE TABLE numbers_sequence (
    step_number INT PRIMARY KEY,
    value INT NOT NULL
);

-- STEP 2 - BASE CASE (START VALUE)
INSERT INTO numbers_sequence (step_number, value)
VALUES (1, 1);


-- STEP 3 - RECURSIVE LOGIC (CORE)
WITH RECURSIVE seq AS (
    SELECT
        1 AS step_number,
        1 AS value
    UNION ALL
    SELECT
        step_number + 1,
        CASE
            WHEN value * 2 < 100 THEN value * 2
            ELSE value + 1
        END
    FROM seq
    WHERE value < 100
)
INSERT INTO numbers_sequence
SELECT * FROM seq;