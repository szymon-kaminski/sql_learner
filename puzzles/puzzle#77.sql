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

-- STEP 5:
-- Compute nearest known previous and next values
-- Using window functions: MAX() OVER with RANGE window
WITH prev_val AS (
    SELECT
        TempID,
        TempValue,
        -- most recent known previous temperature
        MAX(TempValue) OVER (
            ORDER BY TempID
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS PrevKnown
    FROM temperatures
),
next_val AS (
    SELECT
        TempID,
        TempValue,
        PrevKnown,
        -- nearest known following temperature
        MAX(TempValue) OVER (
            ORDER BY TempID DESC
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS NextKnown
    FROM prev_val


-- STEP 6: Final selection
-- Fill missing TempValue = GREATEST(PrevKnown, NextKnown)
SELECT
    TempID,
    COALESCE(TempValue, GREATEST(PrevKnown, NextKnown)) AS TempValue
FROM next_val
ORDER BY TempID;