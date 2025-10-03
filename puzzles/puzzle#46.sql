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

-- Preview input
SELECT * FROM Accounts46 ORDER BY AccountID;


-- Method 1: GROUP BY + HAVING
-- Step 2a: Using GROUP BY and HAVING with MAX
SELECT AccountID
FROM Accounts46
GROUP BY AccountID
HAVING MAX(Balance) <= 0;


-- Method 2: NOT EXISTS
-- Step 2b: Using NOT EXISTS
SELECT DISTINCT A.AccountID
FROM Accounts46 A
WHERE NOT EXISTS (
    SELECT 1
    FROM Accounts46 B
    WHERE B.AccountID = A.AccountID
      AND B.Balance > 0
);


-- Method 3: EXCEPT / MINUS (zależnie od bazy)
-- Step 2c: Using EXCEPT (or MINUS in Oracle)
SELECT DISTINCT AccountID FROM Accounts46
EXCEPT
SELECT DISTINCT AccountID FROM Accounts46 WHERE Balance > 0;
