-- Puzzle #51 - Primary Key Creation

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
(3003, 'Bolt');\

-- Preview data
SELECT * FROM AsemblyParts;


-- Step 2: Create a checksum key
ALTER TABLE AssemblyParts
ADD ChecksumKey AS CHECKSUM(AssemblyID, Part);


-- Step 3: Create a hash key using HASHBYTES
-- In MySQL (using MD5 or SHA1), syntax differs slightly
-- Here’s the SQL Server style (if you use SQL Server):
ALTER TABLE AssemblyParts
ADD HashKey AS CONVERT(VARCHAR(40), HASHBYTES('SHA1', CONCAT(AssemblyID, Part)), 2);

