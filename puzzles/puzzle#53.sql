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