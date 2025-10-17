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


-- Step 2: Refine output columns and adjust position calculation

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

    UNION ALL

    SELECT
        RowNumber + 1,
        QuoteID,
        String,
        Ends + 2 AS Starts,
        Ends + 
            CASE 
                WHEN LOCATE(' ', Remainder) > 0 
                THEN LOCATE(' ', Remainder)
                ELSE LENGTH(Remainder) + 1
            END + 1 AS Ends,
        CASE 
            WHEN LOCATE(' ', Remainder) > 0 
            THEN SUBSTRING(Remainder, 1, LOCATE(' ', Remainder) - 1)
            ELSE Remainder
        END AS Word,
        CASE 
            WHEN LOCATE(' ', Remainder) > 0 
            THEN SUBSTRING(Remainder, LOCATE(' ', Remainder) + 1)
            ELSE ''
        END AS Remainder
    FROM SplitWords
    WHERE Remainder <> ''
)
SELECT RowNumber, QuoteID, String, Starts, Ends, Word
FROM SplitWords
ORDER BY QuoteID, RowNumber;