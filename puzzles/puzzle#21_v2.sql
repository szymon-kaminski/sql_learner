-- Puzzle #21: Average Monthly Sales

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
    OrderID INT,
    CustomerID INT,
    OrderDate DATE,
    Amount DECIMAL(10,2),
    State VARCHAR(10)
);

INSERT INTO Orders VALUES
(1, 1001, '2018-01-01', 100, 'TX'),
(2, 1001, '2018-01-01', 150, 'TX'),
(3, 1001, '2018-01-01', 75,  'TX'),
(4, 1001, '2018-02-01', 100, 'TX'),
(5, 1001, '2018-03-01', 100, 'TX'),
(6, 2002, '2018-02-01', 100, 'TX'),
(7, 2002, '2018-02-01', 75,  'TX'),
(8, 3003, '2018-01-01', 150, 'TX'),
(9, 3003, '2018-02-01', 100, 'IA'),
(10,3003, '2018-03-01', 100, 'IA'),
(11,4004, '2018-04-01', 100, 'IA'),
(12,4004, '2018-05-01', 100, 'IA'),
(13,4004, '2018-05-01', 50,  'IA');


-- Step 2: Compute monthly totals per customer
WITH MonthlyTotals AS (
    SELECT 
        CustomerID,
        State,
        YEAR(OrderDate) AS Yr,
        MONTH(OrderDate) AS Mn,
        SUM(Amount) AS MonthlyAmount
    FROM Orders
    GROUP BY CustomerID, State, YEAR(OrderDate), MONTH(OrderDate)
),


-- Step 3: Keep only customers who had ALL months > 100
ValidCustomers AS (
    SELECT CustomerID, State
    FROM MonthlyTotals
    GROUP BY CustomerID, State
    HAVING MIN(MonthlyAmount) > 100
)