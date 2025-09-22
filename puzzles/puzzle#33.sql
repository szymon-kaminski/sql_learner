-- Puzzle #33: Deadlines

-- Step 1: Create base tables
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    Product VARCHAR(50),
    DaysToDeliver INT
);

INSERT INTO Orders (OrderID, Product, DaysToDeliver) VALUES
(1, 'Aurora', 7),
(2, 'Twilight', 3),
(3, 'SunRay', 9);

DROP TABLE IF EXISTS Manufacturing;
CREATE TABLE Manufacturing (
    Product VARCHAR(50),
    Component VARCHAR(50),
    DaysToManufacture INT
);

INSERT INTO Manufacturing (Product, Component, DaysToManufacture) VALUES
('Aurora', 'Photon Coil', 7),
('Aurora', 'Filament', 2),
('Aurora', 'Shine Capacitor', 3),
('Aurora', 'Glow Sphere', 1),
('Twilight', 'Photon Coil', 7),
('Twilight', 'Filament', 2),
('SunRay', 'Shine Capacitor', 3),
('SunRay', 'Photon Coil', 1);

-- Preview input data
SELECT * FROM Orders;
SELECT * FROM Manufacturing;
