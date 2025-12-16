-- PUZZLE #8: Four Vehicles Problem 
-- Generate all assignments of 10 people (A1..A5 adults, C1..C5 children)
-- into vehicles: motorcycle(1), sidecar(2), golf_cart(3), car(4)
-- Conditions:
--  * seating order inside each vehicle does NOT matter (combinations)
--  * each vehicle must contain at least one adult
-- Expected total rows: 7,200

-- Step 0 - Create database and base tables
DROP DATABASE IF EXISTS puzzle8;
CREATE DATABASE puzzle8;
USE puzzle8;

-- Step 1: Persons
CREATE TABLE people (
    person_id INT PRIMARY KEY,
    is_adult BOOLEAN
);

INSERT INTO people VALUES
(1, TRUE), (2, TRUE), (3, TRUE), (4, TRUE), (5, TRUE),
(6, FALSE), (7, FALSE), (8, FALSE), (9, FALSE), (10, FALSE);
