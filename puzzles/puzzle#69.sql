-- Puzzle #69 - Splitting a Hierarchy

-- STEP 1: Create database and table
CREATE DATABASE IF NOT EXISTS puzzle69;
USE puzzle69;

CREATE TABLE hierarchy (
    Parent CHAR(1),
    Child CHAR(1)
);

INSERT INTO hierarchy (Parent, Child) VALUES
('A','B'),
('A','C'),
('B','D'),
('B','E'),
('C','F'),
('D','G');

-- STEP 2: Verify input data
SELECT * FROM hierarchy;