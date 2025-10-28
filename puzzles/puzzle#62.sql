-- Puzzle #62: Car and boat purchase

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_puzzles;
USE sql_puzzles;

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    Type VARCHAR(10),
    Model VARCHAR(50),
    Price INT
);
