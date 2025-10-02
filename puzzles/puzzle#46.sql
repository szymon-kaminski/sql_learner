-- Puzzle #46 - Negative Account Balances 

-- Step 1: Create table with sample account balances
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Accounts46;
CREATE TABLE Accounts46 (
    AccountID INT,
    Balance DECIMAL(10,2)
);

INSERT INTO Accounts46 (AccountID, Balance) VALUES
(1001, 234.45),
(1001, -23.12),
(2002, -93.01),
(2002, -120.19),
(3003, 186.76),
(3003, 90.23),
(3003, 10.11);
