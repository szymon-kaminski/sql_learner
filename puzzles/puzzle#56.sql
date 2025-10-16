-- Puzzle #56 - Numbers Using Recursion

-- Environment setup
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS NumbersTable;

-- Step 1: Initialize recursive CTE with base value

WITH RECURSIVE Numbers AS (
    SELECT 1 AS Number


-- Step 2: Add recursive logic to increment numbers

    UNION ALL
    SELECT Number + 1
    FROM Numbers
    WHERE Number < 10
)
