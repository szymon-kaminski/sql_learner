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


-- Step 2: Insert sample data
INSERT INTO Vehicles (VehicleID, Type, Model, Price) VALUES
(1, 'Car', 'Rolls-Royce Phantom', 460000),
(2, 'Car', 'Cadillac CT5', 39000),
(3, 'Car', 'Porsche Boxster', 63000),
(4, 'Car', 'Lamborghini Spyder', 290000),
(5, 'Boat', 'Malibu', 210000),
(6, 'Boat', 'ATX 22-S', 85000),
(7, 'Boat', 'Sea Ray SLX', 520000),
(8, 'Boat', 'Mastercraft', 25000);

-- Preview data
SELECT * FROM Vehicles;