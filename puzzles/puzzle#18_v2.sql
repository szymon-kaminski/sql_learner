USE sql_learner;

-- Step 1 — Utworzenie tabeli i wstawienie danych

DROP TABLE IF EXISTS SeatingChart;
CREATE TABLE SeatingChart (
    SeatNumber INT
);

INSERT INTO SeatingChart (SeatNumber) VALUES
(7),(13),(14),(15),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(52),(53),(54);

-- Step 2 — Znalezienie luk w numeracji (z poprawką na początek)

WITH SeatsWithNext AS (
    SELECT 
        SeatNumber,
        LEAD(SeatNumber) OVER (ORDER BY SeatNumber) AS NextSeat
    FROM SeatingChart
),
Gaps AS (
    SELECT 
        SeatNumber + 1 AS GapStart,
        NextSeat - 1 AS GapEnd
    FROM SeatsWithNext
    WHERE NextSeat IS NOT NULL
      AND NextSeat > SeatNumber + 1
)
SELECT GapStart, GapEnd 
FROM Gaps
UNION ALL
SELECT 1, t.min_seat - 1
FROM (SELECT MIN(SeatNumber) AS min_seat FROM SeatingChart) t
WHERE t.min_seat > 1
ORDER BY GapStart;

-- Step 3 — Liczba wszystkich brakujących miejsc

WITH SeatsWithNext AS (
    SELECT 
        SeatNumber,
        LEAD(SeatNumber) OVER (ORDER BY SeatNumber) AS NextSeat
    FROM SeatingChart
),
Missing AS (
    SELECT SUM(NextSeat - SeatNumber - 1) AS Missing
    FROM SeatsWithNext
    WHERE NextSeat IS NOT NULL
      AND NextSeat > SeatNumber + 1
    UNION ALL
    SELECT t.min_seat - 1
    FROM (SELECT MIN(SeatNumber) AS min_seat FROM SeatingChart) t
    WHERE t.min_seat > 1
)
SELECT SUM(Missing) AS TotalMissingNumbers FROM Missing;

-- Step 4 — Podział na parzyste i nieparzyste

SELECT 
    CASE WHEN SeatNumber % 2 = 0 THEN 'Even Numbers' ELSE 'Odd Numbers' END AS Type,
    COUNT(*) AS Count
FROM SeatingChart
GROUP BY Type;
