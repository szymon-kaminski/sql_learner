-- Puzzle #48 — Consecutive Sales
-- Cel: Znaleźć klientów (SalesID), którzy mieli sprzedaż
-- w bieżącym roku (2021) oraz w dwóch poprzednich (2020, 2019)


-- Step 1: Utwórz tabelę i wstaw dane testowe
DROP TABLE IF EXISTS Sales;

CREATE TABLE Sales (
  SalesID INT,
  Year INT
);

INSERT INTO Sales VALUES
(1001, 2018),
(1001, 2019),
(1001, 2020),
(2002, 2020),
(2002, 2021),
(3003, 2018),
(3003, 2020),
(3003, 2021),
(4004, 2019),
(4004, 2020),
(4004, 2021);


-- Step 2: Podgląd danych wejściowych
SELECT * FROM Sales ORDER BY SalesID, Year;


-- Step 3: Rozwiązanie #1 — z użyciem JOIN
SELECT DISTINCT s1.SalesID
FROM Sales s1
JOIN Sales s2 
  ON s1.SalesID = s2.SalesID AND s2.Year = s1.Year - 1
JOIN Sales s3 
  ON s1.SalesID = s3.SalesID AND s3.Year = s1.Year - 2
WHERE s1.Year = 2021;

