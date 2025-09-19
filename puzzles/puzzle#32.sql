-- Puzzle #32: First and Last

-- Step 1: Create base table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Spacemen;
CREATE TABLE Spacemen (
    SpacemanID INT PRIMARY KEY,
    JobDescription VARCHAR(50),
    MissionCount INT
);

INSERT INTO Spacemen (SpacemanID, JobDescription, MissionCount) VALUES
(1001, 'Astrogator', 6),
(2002, 'Astrogator', 12),
(3003, 'Astrogator', 17),
(4004, 'Geologist', 21),
(5005, 'Geologist', 9),
(6006, 'Geologist', 8),
(7007, 'Technician', 13),
(8008, 'Technician', 2),
(9009, 'Technician', 7);

SELECT * FROM Spacemen ORDER BY SpacemanID, JobDescription, MissionCount;

-- Step 2: Find most and least experienced spacemen per job
-- We use subqueries to get SpacemanID for MAX and MIN MissionCount
SELECT 
    s.JobDescription,
    (SELECT SpacemanID 
     FROM Spacemen 
     WHERE JobDescription = s.JobDescription 
     ORDER BY MissionCount DESC 
     LIMIT 1) AS MostExperienced,
    (SELECT SpacemanID 
     FROM Spacemen 
     WHERE JobDescription = s.JobDescription 
     ORDER BY MissionCount ASC 
     LIMIT 1) AS LeastExperienced
FROM Spacemen s
GROUP BY s.JobDescription;
