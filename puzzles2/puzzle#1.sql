-- Puzzle #1 - Factorials
-- Create a numbers table of 1 through 10 and their factorials.

-- STEP 1: Create database
CREATE DATABASE IF NOT EXISTS puzzle1;
USE puzzle1;


-- STEP 2: Drop existing table
DROP TABLE IF EXISTS factorials;


-- STEP 3: Create table
CREATE TABLE factorials (
    Number INT,
    Factorial BIGINT
);


-- STEP 4: Insert numbers 1–10
INSERT INTO factorials (Number) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
