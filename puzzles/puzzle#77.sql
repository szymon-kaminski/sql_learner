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

-- STEP 4: Insert sample data
INSERT INTO temperatures (TempID, TempValue) VALUES
(1, 52),
(2, NULL),
(3, NULL),
(4, 65),
(5, NULL),
(6, 72),
(7, NULL),
(8, 70),
(9, NULL),
(10, 75),
(11, NULL),
(12, 80);

-- Preview input data
SELECT * FROM temperatures;