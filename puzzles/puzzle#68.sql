-- Puzzle #68: Removing outliers

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS puzzle68;
USE puzzle68;

CREATE TABLE IF NOT EXISTS Scores (
    Team VARCHAR(50),
    Year INT,
    Score INT
);


-- Step 2: Insert data
INSERT INTO Scores (Team, Year, Score) VALUES
('Cougars', 2015, 50),
('Cougars', 2016, 45),
('Cougars', 2017, 65),
('Cougars', 2018, 92),
('Bulldogs', 2015, 65),
('Bulldogs', 2016, 60),
('Bulldogs', 2017, 58),
('Bulldogs', 2018, 12);

-- Preview input data
SELECT * FROM Scores;
