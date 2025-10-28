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


-- Step 3: Find all car–boat pairs where car is $200,000 more expensive
SELECT 
    c.Model AS Car,
    b.Model AS Boat
FROM Vehicles AS c
JOIN Vehicles AS b
    ON c.Type = 'Car'
   AND b.Type = 'Boat'
   AND c.Price = b.Price + 200000;
