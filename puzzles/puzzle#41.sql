-- Puzzle #41 — Associate IDs

-- Step 1: Utworzenie tabeli i danych wejściowych
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

CREATE TABLE Associates (
    Associate1 VARCHAR(50),
    Associate2 VARCHAR(50)
);

INSERT INTO Associates (Associate1, Associate2) VALUES
('Anne', 'Betty'),
('Anne', 'Charles'),
('Betty', 'Dan'),
('Charles', 'Emma'),
('Francis', 'George'),
('George', 'Harriet');

-- Step 2: Podgląd danych wejściowych
SELECT * FROM Associates;
