-- Puzzle #57 - Find the Spaces

-- Step 1: Setup database and base table

CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Statements;

CREATE TABLE Statements (
    QuoteID INT,
    StatementText VARCHAR(100)
);

INSERT INTO Statements VALUES
(1, 'SELECT EmpID FROM Employees;'),
(2, 'SELECT * FROM Transactions;');


-- Step 2: Create base anchor part of recursive CTE

WITH RECURSIVE SplitWords AS (
    SELECT
        1 AS RowNumber,
        QuoteID,
        StatementText AS String,
        1 AS Starts,
        CASE 
            WHEN LOCATE(' ', StatementText) > 0 
            THEN LOCATE(' ', StatementText) - 1
            ELSE LENGTH(StatementText)
        END AS Ends,
        CASE 
            WHEN LOCATE(' ', StatementText) > 0 
            THEN SUBSTRING(StatementText, 1, LOCATE(' ', StatementText) - 1)
            ELSE StatementText
        END AS Word,
        CASE 
            WHEN LOCATE(' ', StatementText) > 0 
            THEN SUBSTRING(StatementText, LOCATE(' ', StatementText) + 1)
            ELSE ''
        END AS Remainder
    FROM Statements
)
SELECT * FROM SplitWords;