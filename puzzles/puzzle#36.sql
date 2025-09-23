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
