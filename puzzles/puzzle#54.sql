-- Puzzle #51 - Primary Key Creation (MySQL)

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS AssemblyParts;
CREATE TABLE AssemblyParts (
    AssemblyID INT,
    Part VARCHAR(50)
);

INSERT INTO AssemblyParts (AssemblyID, Part) VALUES
(1001, 'Bolt'),
(1001, 'Screw'),
(2002, 'Nut'),
(2002, 'Washer'),
(3003, 'Toggle'),
(3003, 'Bolt');
