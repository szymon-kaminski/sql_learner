-- PUZZLE #8: Four Vehicles Problem 
-- Generate all assignments of 10 people (A1..A5 adults, C1..C5 children)
-- into vehicles: motorcycle(1), sidecar(2), golf_cart(3), car(4)
-- Conditions:
--  * seating order inside each vehicle does NOT matter (combinations)
--  * each vehicle must contain at least one adult
-- Expected total rows: 7,200

-- STEP 0 - BAZA
DROP DATABASE IF EXISTS puzzle8;
CREATE DATABASE puzzle8;
USE puzzle8;


-- STEP 1 - PEOPLE
DROP TABLE IF EXISTS people;
CREATE TABLE people (
    id INT PRIMARY KEY,
    name VARCHAR(10),
    is_adult TINYINT(1)
);

-- insert 5 adults A1..A5 and 5 children C1..C5
TRUNCATE TABLE people;
INSERT INTO people (id, name, is_adult) VALUES
(1, 'A1', 1),
(2, 'A2', 1),
(3, 'A3', 1),
(4, 'A4', 1),
(5, 'A5', 1),
(6, 'C1', 0),
(7, 'C2', 0),
(8, 'C3', 0),
(9, 'C4', 0),
(10,'C5', 0);


-- STEP 2 - OUTPUT TABLE
DROP TABLE IF EXISTS assignments;
CREATE TABLE assignments (
    motorcycle VARCHAR(10),
    sidecar VARCHAR(50),
    golf_cart VARCHAR(100),
    car VARCHAR(200),
    permutation VARCHAR(400),
    PRIMARY KEY (permutation)
);
