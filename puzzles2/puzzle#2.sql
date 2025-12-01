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
