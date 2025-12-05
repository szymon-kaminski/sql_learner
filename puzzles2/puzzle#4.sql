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
