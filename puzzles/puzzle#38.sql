-- Puzzle #38: Reporting Elements

-- Step 1: Create table with input data
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
