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

-- Step 2 - Create output table

CREATE TABLE assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    motorcycle_driver INT,
    sidecar_driver INT,
    sidecar_passenger INT,
    golf_driver INT,
    golf_passenger1 INT,
    golf_passenger2 INT,
    car_driver INT,
    car_passenger1 INT,
    car_passenger2 INT,
    car_passenger3 INT
);


-- Step 3: Generate all 7200 assignments
INSERT INTO assignments (
    motorcycle_driver,
    sidecar_driver,
    sidecar_passenger,
    golf_driver,
    golf_passenger1,
    golf_passenger2,
    car_driver,
    car_passenger1,
    car_passenger2,
    car_passenger3
)
SELECT
    a1.person_id AS motorcycle_driver,
    a2.person_id AS sidecar_driver,
    p1.person_id AS sidecar_passenger,
    a3.person_id AS golf_driver,
    p2.person_id AS golf_passenger1,
    p3.person_id AS golf_passenger2,
    a4.person_id AS car_driver,
    p4.person_id AS car_passenger1,
    p5.person_id AS car_passenger2,
    p6.person_id AS car_passenger3
FROM
    people a1
JOIN people a2 ON a2.person_id <> a1.person_id AND a2.is_adult = TRUE
JOIN people a3 ON a3.person_id NOT IN (a1.person_id, a2.person_id) AND a3.is_adult = TRUE
JOIN people a4 ON a4.person_id NOT IN (a1.person_id, a2.person_id, a3.person_id) AND a4.is_adult = TRUE
JOIN people p1 ON p1.person_id NOT IN (a1.person_id, a2.person_id, a3.person_id, a4.person_id)
JOIN people p2 ON p2.person_id NOT IN (a1.person_id, a2.person_id, a3.person_id, a4.person_id, p1.person_id)
JOIN people p3 ON p3.person_id NOT IN (a1.person_id, a2.person_id, a3.person_id, a4.person_id, p1.person_id, p2.person_id)
JOIN people p4 ON p4.person_id NOT IN (a1.person_id, a2.person_id, a3.person_id, a4.person_id, p1.person_id, p2.person_id, p3.person_id)
JOIN people p5 ON p5.person_id NOT IN (a1.person_id, a2.person_id, a3.person_id, a4.person_id, p1.person_id, p2.person_id, p3.person_id, p4.person_id)
JOIN people p6 ON p6.person_id NOT IN (a1.person_id, a2.person_id, a3.person_id, a4.person_id, p1.person_id, p2.person_id, p3.person_id, p4.person_id, p5.person_id)
WHERE
    a1.is_adult = TRUE;
