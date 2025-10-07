-- Puzzle #49 – Sumo Wrestlers

-- Step 1: Setup environment and create table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS SumoWrestlers;
CREATE TABLE SumoWrestlers (
    LineOrder INT,
    Name VARCHAR(50),
    Weight INT
);

INSERT INTO SumoWrestlers (LineOrder, Name, Weight) VALUES
(1, 'Haruto', 611),
(2, 'Minato', 533),
(3, 'Haruki', 623),
(4, 'Sota', 569),
(5, 'Aoto', 610),
(6, 'Hinata', 525);
