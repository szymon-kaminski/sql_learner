-- Puzzle #36: Traveling Salesman

-- Step 1: Create base table with route data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Routes36;
CREATE TABLE Routes36 (
    RouteID INT,
    DepartureCity VARCHAR(50),
    ArrivalCity VARCHAR(50),
    Cost INT
);

INSERT INTO Routes36 (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1, 'Austin', 'Dallas', 100),
(1, 'Dallas', 'Austin', 100),
(2, 'Dallas', 'Memphis', 200),
(2, 'Memphis', 'Dallas', 200),
(3, 'Memphis', 'Des Moines', 300),
(3, 'Des Moines', 'Memphis', 300),
(4, 'Dallas', 'Des Moines', 400),
(4, 'Des Moines', 'Dallas', 400);

-- Preview input data
SELECT * FROM Routes36;


-- Step 2: Find all possible routes from Austin to Des Moines with total cost
SELECT 
    CONCAT(r1.DepartureCity, ' --> ', r1.ArrivalCity, ' --> ', r2.ArrivalCity) AS RoutePath,
    (r1.Cost + r2.Cost) AS TotalCost
FROM Routes36 r1
JOIN Routes36 r2 ON r1.ArrivalCity = r2.DepartureCity
WHERE r1.DepartureCity = 'Austin' AND r2.ArrivalCity = 'Des Moines'

UNION ALL

SELECT 
    CONCAT(r1.DepartureCity, ' --> ', r1.ArrivalCity, ' --> ', r2.ArrivalCity, ' --> ', r3.ArrivalCity) AS RoutePath,
    (r1.Cost + r2.Cost + r3.Cost) AS TotalCost
FROM Routes36 r1
JOIN Routes36 r2 ON r1.ArrivalCity = r2.DepartureCity
JOIN Routes36 r3 ON r2.ArrivalCity = r3.DepartureCity
WHERE r1.DepartureCity = 'Austin' AND r3.ArrivalCity = 'Des Moines';
