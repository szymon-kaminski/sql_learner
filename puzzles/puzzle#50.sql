-- Puzzle #50 – Baseball Balls and Strikes

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Pitches;
CREATE TABLE Pitches (
    BatterID INT,
    PitchNumber INT,
    Result VARCHAR(20)
);

INSERT INTO Pitches (BatterID, PitchNumber, Result) VALUES
(1001, 1, 'Foul'),
(1001, 2, 'Foul'),
(1001, 3, 'Ball'),
(1001, 4, 'Ball'),
(1001, 5, 'Strike'),
(2002, 1, 'Ball'),
(2002, 2, 'Strike'),
(2002, 3, 'Foul'),
(2002, 4, 'Foul'),
(2002, 5, 'Foul'),
(2002, 6, 'In Play'),
(3003, 1, 'Ball'),
(3003, 2, 'Ball'),
(3003, 3, 'Ball'),
(3003, 4, 'Ball'),
(4004, 1, 'Foul'),
(4004, 2, 'Foul'),
(4004, 3, 'Foul'),
(4004, 4, 'Foul'),
(4004, 5, 'Foul'),
(4004, 6, 'Strike');
