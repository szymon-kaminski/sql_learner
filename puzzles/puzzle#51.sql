-- Puzzle #51 – Primary Key Creation (MySQL)

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

-- preview data
SELECT * FROM AssemblyParts;


-- Step 2: Add columns for hash and checksum equivalents
ALTER TABLE AssemblyParts
ADD COLUMN ChecksumKey BIGINT,
ADD COLUMN HashKey VARCHAR(32);

-- Step 3: Update columns using CRC32() and MD5()
UPDATE AssemblyParts
SET 
    ChecksumKey = CRC32(CONCAT(AssemblyID, Part)),
    HashKey = MD5(CONCAT(AssemblyID, Part));

-- Step 4: View the result
SELECT 
    AssemblyID,
    Part,
    ChecksumKey,
    HashKey
FROM AssemblyParts;


