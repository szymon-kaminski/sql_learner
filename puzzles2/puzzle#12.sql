-- Puzzle #12 - Double or Add 1

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle12;
CREATE DATABASE puzzle12;
USE puzzle12;


-- STEP 1 - OUTPUT TABLE
CREATE TABLE numbers_sequence (
    step_number INT PRIMARY KEY,
    value INT NOT NULL
);

-- STEP 2 - BASE CASE (START VALUE)
INSERT INTO numbers_sequence (step_number, value)
VALUES (1, 1);