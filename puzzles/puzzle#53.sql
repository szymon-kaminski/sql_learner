-- Puzzle #53: Spouse IDs

-- Step 1 - Create Database and Use It
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;


-- Step 2 - Create the Source Table

CREATE TABLE Spouses (
    PrimaryID VARCHAR(20),
    SpouseID VARCHAR(20)
);

INSERT INTO Spouses (PrimaryID, SpouseID) VALUES
('Pat', 'Charlie'),
('Jordan', 'Casey'),
('Ashley', 'Dee'),
('Charlie', 'Pat'),
('Casey', 'Jordan'),
('Dee', 'Ashley');

-- Preview data
SELECT * FROM Spouses;


-- Step 3: Add query using DENSE_RANK and CASE to generate group IDs
SELECT 
    DENSE_RANK() OVER (
        ORDER BY CASE 
                     WHEN PrimaryID < SpouseID 
                     THEN CONCAT(PrimaryID, SpouseID)
                     ELSE CONCAT(SpouseID, PrimaryID) 
                 END
    ) AS GroupID,
    PrimaryID,
    SpouseID
FROM Spouses;
ORDER BY GroupID, PrimaryID;