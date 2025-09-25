-- Puzzle #39 — Prime Numbers

-- Step 1: Utworzenie bazy danych i tabeli
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

CREATE TABLE PrimeNumbers (
    IntegerValue INTEGER PRIMARY KEY
);

INSERT INTO PrimeNumbers (IntegerValue) VALUES
(1),(2),(3),(4),(5),(6),(7),(8),(9),(10);
