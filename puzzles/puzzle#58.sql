-- Puzzle #58 - Add Them Up

-- Step 1: Utworzenie tabeli i wstawienie danych
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

CREATE TABLE Equations (
    Equation VARCHAR(20)
);

INSERT INTO Equations (Equation) VALUES
('123'),
('1+2+3'),
('1+2-3'),
('1+23'),
('1-2+3'),
('1-2-3'),
('1-23'),
('12+3'),
('12-3');
