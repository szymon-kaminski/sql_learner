-- Puzzle #45 — Slowly Changing Dimension Part II

-- Step 1: Create table with overlapping SCD ranges
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Balances45;
CREATE TABLE Balances45 (
    CustomerID INT,
    StartDate DATE,
    EndDate DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO Balances45 (CustomerID, StartDate, EndDate, Amount) VALUES
(1001, '2021-10-11', '9999-12-31', 54.32),
(1001, '2021-10-10', '2021-10-10', 17.65),
(1001, '2021-09-18', '2021-10-12', 65.56),
(2002, '2021-09-12', '2021-09-17', 56.23),
(2002, '2021-09-01', '2021-09-17', 42.12),
(2002, '2021-08-15', '2021-08-31', 16.32);

-- Preview input
SELECT * FROM Balances45 ORDER BY CustomerID, StartDate;


-- Step 2: Find overlapping SCD records
SELECT DISTINCT A.CustomerID, A.StartDate, A.EndDate, A.Amount
FROM Balances45 A
JOIN Balances45 B
  ON A.CustomerID = B.CustomerID
 AND A.StartDate <= B.EndDate
 AND A.EndDate >= B.StartDate
 AND A.StartDate < B.StartDate
ORDER BY A.CustomerID, A.StartDate;
