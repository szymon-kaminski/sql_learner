-- Puzzle #44 — Slowly Changing Dimension Part I

-- Step 1: Prepare base table with balance data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Balances44;
CREATE TABLE Balances44 (
    CustomerID INT,
    BalanceDate DATE,
    Amount DECIMAL(10,2)
);

INSERT INTO Balances44 (CustomerID, BalanceDate, Amount) VALUES
(1001, '2021-10-11', 54.32),
(1001, '2021-10-10', 17.65),
(1001, '2021-09-18', 65.56),
(1001, '2021-09-12', 56.23),
(1001, '2021-09-01', 42.12),
(2002, '2021-10-15', 46.52),
(2002, '2021-10-13', 7.65),
(2002, '2021-09-15', 75.12),
(2002, '2021-09-10', 47.34),
(2002, '2021-09-02', 11.11);

-- Preview input
SELECT * FROM Balances44 ORDER BY CustomerID, BalanceDate DESC;
