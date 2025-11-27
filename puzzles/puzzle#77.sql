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


-- STEP 5 (replacement): Compute nearest previous and next known values using correlated subqueries
-- and produce final filled output (compatible with older MySQL versions).

SELECT
    t1.TempID,
    -- jeśli wartość istnieje -> zostawiamy, w przeciwnym razie bierzemy większą z PrevKnown i NextKnown
    COALESCE(
        t1.TempValue,
        GREATEST(
            -- PrevKnown: najbliższa znana wartość z przeszłości (TempID <= current)
            (SELECT t2.TempValue
             FROM temperatures t2
             WHERE t2.TempValue IS NOT NULL
               AND t2.TempID <= t1.TempID
             ORDER BY t2.TempID DESC
             LIMIT 1),
            -- NextKnown: najbliższa znana wartość z przyszłości (TempID >= current)
            (SELECT t3.TempValue
             FROM temperatures t3
             WHERE t3.TempValue IS NOT NULL
               AND t3.TempID >= t1.TempID
             ORDER BY t3.TempID ASC
             LIMIT 1)
        )
    ) AS TempValue
FROM temperatures t1
ORDER BY t1.TempID;


-- STEP 6: Final selection
-- Fill missing TempValue = GREATEST(PrevKnown, NextKnown)
SELECT
    TempID,
    COALESCE(TempValue, GREATEST(PrevKnown, NextKnown)) AS TempValue
ORDER BY TempID;