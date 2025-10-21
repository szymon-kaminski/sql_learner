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

-- STEP 4: Split strings into individual characters
DROP TABLE IF EXISTS SplitChars;

-- We'll create a helper table "numbers" (1–10) to iterate through each character position.
WITH numbers AS (
    SELECT 1 AS n UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION
    SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
)
SELECT 
    b.ID,
    MID(b.String, n, 1) AS Char,
    n AS Position
INTO SplitChars
FROM BalancedStrings AS b
JOIN numbers ON n <= CHAR_LENGTH(b.String);

SELECT * FROM SplitChars ORDER BY ID, Position;


-- STEP 5: Preliminary logic to check balance (simplified)
-- This is a simplified version using pattern matching for common balanced forms.
-- Later, we can improve it with procedural logic or stored functions.
SELECT 
    ID,
    String,
    CASE 
        WHEN String IN ('()', '[]', '{}', '(({}))', '()[]', '{()}')
             THEN 'Balanced'
        ELSE 'Unbalanced'
    END AS Outcome
FROM BalancedStrings;
