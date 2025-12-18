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
