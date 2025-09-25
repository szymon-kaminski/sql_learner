-- Puzzle #40 — Sort Order

-- Step 1: Utworzenie tabeli i wstawienie danych
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

CREATE TABLE Cities (
    City VARCHAR(50) PRIMARY KEY
);

INSERT INTO Cities (City) VALUES
('Atlanta'),
('Baltimore'),
('Chicago'),
('Denver');

-- Step 2: Podgląd danych wejściowych
SELECT * FROM Cities;


-- Step 3: Posortowanie zgodnie z oczekiwanym wynikiem
SELECT City
FROM Cities
ORDER BY
    CASE City
        WHEN 'Baltimore' THEN 1
        WHEN 'Denver'    THEN 2
        WHEN 'Atlanta'   THEN 3
        WHEN 'Chicago'   THEN 4
    END;
