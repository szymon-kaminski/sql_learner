-- Puzzle #38: Reporting Elements

-- Step 1: Create table with input data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Sales38;
CREATE TABLE Sales38 (
    Region VARCHAR(20),
    Distributor VARCHAR(50),
    Sales INT
);

INSERT INTO Sales38 (Region, Distributor, Sales) VALUES
('North', 'ACE', 10),
('South', 'ACE', 67),
('East',  'ACE', 54),
('North', 'ACME', 65),
('South', 'ACME', 9),
('East',  'ACME', 1),
('West',  'ACME', 7),
('North', 'Direct Parts', 8),
('South', 'Direct Parts', 7),
('West',  'Direct Parts', 12);

-- Preview input data
SELECT * FROM Sales38;


-- Step 2: Build full region × distributor combinations with cross join
WITH Regions AS (
    SELECT DISTINCT Region FROM Sales38
),
Distributors AS (
    SELECT DISTINCT Distributor FROM Sales38
),
AllCombos AS (
    SELECT r.Region, d.Distributor
    FROM Regions r
    CROSS JOIN Distributors d
)
SELECT 
    a.Region,
    a.Distributor,
    COALESCE(s.Sales, 0) AS Sales
FROM AllCombos a
LEFT JOIN Sales38 s 
    ON a.Region = s.Region 
   AND a.Distributor = s.Distributor
ORDER BY a.Distributor, a.Region;
