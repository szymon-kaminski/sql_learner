-- Puzzle #59 — Balanced String

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS BalancedStrings;

CREATE TABLE BalancedStrings (
    ID INT PRIMARY KEY,
    String VARCHAR(50)
);

-- STEP 2: Insert example data
INSERT INTO Brackets (ID, String) VALUES
(1, '()'),
(2, '[]'),
(3, '{}'),
(4, '((({[]})))'),
(5, '()[ ]'),
(6, '{()}'),
(7, '{(})'),
(8, '(()))()'),
(9, '}{()[[');


-- STEP 3: Add helper table for valid bracket pairs
DROP TABLE IF EXISTS BracketPairs;

CREATE TABLE BracketPairs (
    OpenSymbol CHAR(1),
    CloseSymbol CHAR(1)
);

INSERT INTO BracketPairs VALUES
('(', ')'),
('[', ']'),
('{', '}');