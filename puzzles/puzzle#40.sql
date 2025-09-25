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
