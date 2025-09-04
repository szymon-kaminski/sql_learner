-- Puzzle #18

-- Step 1 — Create table and insert sample data

USE sql_learner;

DROP TABLE IF EXISTS SeatingChart;
CREATE TABLE SeatingChart (
    SeatNumber INT
);

INSERT INTO SeatingChart (SeatNumber) VALUES
(7),(13),(14),(15),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(52),(53),(54);


-- Step 2 — Show raw data

SELECT * FROM SeatingChart ORDER BY SeatNumber;


-- Step 3 — Find gaps (gap start and gap end)
-- Use LEAD() window function to compare current and next seat number

SELECT 
    SeatNumber + 1 AS GapStart,
    LEAD(SeatNumber) OVER (ORDER BY SeatNumber) - 1 AS GapEnd
FROM SeatingChart
WHERE LEAD(SeatNumber) OVER (ORDER BY SeatNumber) - SeatNumber > 1;


-- Step 4 — Count total missing numbers

SELECT 
    (MAX(SeatNumber) - MIN(SeatNumber) + 1) - COUNT(*) 
    AS TotalMissingNumbers
FROM SeatingChart;


-- Step 5 — Count odd and even numbers

SELECT 
    CASE WHEN SeatNumber % 2 = 0 THEN 'Even Numbers' ELSE 'Odd Numbers' END AS Type,
    COUNT(*) AS Count
FROM SeatingChart
GROUP BY Type;