-- Puzzle #10 - Seating Chart


-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle10;
CREATE DATABASE puzzle10;
USE puzzle10;


-- STEP 1 - INPUT TABLE
CREATE TABLE seating_chart (
    seat_number INT PRIMARY KEY
);

INSERT INTO seating_chart (seat_number) VALUES
(7),(13),(14),(15),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(52),(53),(54);


-- STEP 2 - GAP START & GAP END
WITH ordered AS (
    SELECT
        seat_number,
        LAG(seat_number) OVER (ORDER BY seat_number) AS prev_seat
    FROM seating_chart
)
SELECT
    COALESCE(prev_seat + 1, 1) AS gap_start,
    seat_number - 1 AS gap_end
FROM ordered
WHERE prev_seat IS NULL
   OR seat_number - prev_seat > 1;


-- STEP 3 - TOTAL MISSING NUMBERS
WITH ordered AS (
    SELECT
        seat_number,
        LAG(seat_number) OVER (ORDER BY seat_number) AS prev_seat
    FROM seating_chart
)
SELECT
    SUM(seat_number - prev_seat - 1) AS total_missing_numbers
FROM ordered
WHERE prev_seat IS NOT NULL
  AND seat_number - prev_seat > 1;


-- STEP 4 - COUNT ODD & EVEN NUMBERS
SELECT
    CASE
        WHEN seat_number % 2 = 0 THEN 'Even Numbers'
        ELSE 'Odd Numbers'
    END AS type,
    COUNT(*) AS count
FROM seating_chart
GROUP BY type
ORDER BY type;
