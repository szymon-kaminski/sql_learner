-- Puzzle #75 - Symmetric Matches

-- Step 1: Create database
DROP DATABASE IF EXISTS puzzle75;
CREATE DATABASE puzzle75;
USE puzzle75;


-- Step 2: Create table
CREATE TABLE boxes (
    BoxID CHAR(1),
    Length INT,
    Width INT,
    Height INT
);
