-- Puzzle #24: Page Views

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS Orders24;
CREATE TABLE Orders24 (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    State VARCHAR(10)
);

INSERT INTO Orders24 VALUES
(1, 1001, '2018-01-01', 100, 'TX'),
(2, 3003, '2018-01-01', 100, 'TX'),
(3, 1001, '2018-03-01', 100, 'IA'),
(4, 2002, '2018-02-01', 100, 'TX'),
(5, 1001, '2018-02-01', 150, 'TX'),
(6, 4004, '2018-05-01', 100, 'TX'),
(7, 1001, '2018-01-01', 50,  'IA'),
(8, 3003, '2018-03-01', 150, 'TX'),
(9, 4004, '2018-04-01', 100, 'IA'),
(10,1001, '2018-01-01', 100, 'IA'),
(11,2002, '2018-02-01', 75,  'TX'),
(12,3003, '2018-02-01', 75,  'TX'),
(13,4004, '2018-05-01', 100, 'IA');


-- Step 2: Select records ordered by OrderID
SELECT *
FROM Orders24
ORDER BY OrderID;


