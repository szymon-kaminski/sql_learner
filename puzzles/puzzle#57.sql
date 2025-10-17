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