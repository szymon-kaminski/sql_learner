-- Puzzle #77 - Temperature Readings
-- Fill missing temperatures with the larger of:
-- (nearest known previous value) OR (nearest known following value)

-- STEP 1: Create database
CREATE DATABASE IF NOT EXISTS puzzle77;
USE puzzle77;

-- STEP 2: Drop old table
DROP TABLE IF EXISTS temperatures;


-- STEP 3: Create table
CREATE TABLE temperatures (
    TempID INT,
    TempValue INT
);