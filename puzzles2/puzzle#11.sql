-- Puzzle #11 - Count the Groupings

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle11;
CREATE DATABASE puzzle11;
USE puzzle11;


-- STEP 1 - INPUT TABLE
CREATE TABLE process_steps (
    step_number INT PRIMARY KEY,
    status VARCHAR(10)
);

INSERT INTO process_steps VALUES
(1,'Passed'),
(2,'Passed'),
(3,'Passed'),
(4,'Passed'),
(5,'Failed'),
(6,'Failed'),
(7,'Failed'),
(8,'Failed'),
(9,'Failed'),
(10,'Passed'),
(11,'Passed'),
(12,'Passed');
