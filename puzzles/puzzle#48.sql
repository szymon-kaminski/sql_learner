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
