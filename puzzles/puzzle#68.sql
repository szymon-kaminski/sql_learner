-- Puzzle #68: Removing outliers

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS puzzle68;
USE puzzle68;

CREATE TABLE IF NOT EXISTS Scores (
    Team VARCHAR(50),
    Year INT,
    Score INT
);
