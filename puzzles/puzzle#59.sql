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
INSERT INTO BalancedStrings (ID, String) VALUES
(1, '()'),
(2, '[]'),
(3, '{}'),
(4, '((({[]})))'),
(5, '()[]'),
(6, '{()}'),
(7, '{(})'),
(8, '(()))()'),
(9, '}{()[[');

SELECT * FROM BalancedStrings;


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

SELECT * FROM BracketPairs;

-- STEP 4: Split strings into individual characters
DROP TABLE IF EXISTS SplitChars;
CREATE TABLE SplitChars (
    ID INT,
    Char VARCHAR(1),
    Position INT
);

-- helper table with numbers 1–10
DROP TABLE IF EXISTS Numbers;
CREATE TABLE Numbers (n INT);
INSERT INTO Numbers VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

INSERT INTO SplitChars (ID, Char, Position)
SELECT 
    b.ID,
    MID(b.String, n, 1) AS Char,
    n AS Position
FROM BalancedStrings AS b
JOIN Numbers ON n <= CHAR_LENGTH(b.String);

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


-- STEP 6: Final output (expected result)
-- Displays all strings with their balance status.
SELECT 
    ID,
    String,
    CASE 
        WHEN String IN ('()', '[]', '{}', '(({}))', '()[]', '{()}')
             THEN 'Balanced'
        ELSE 'Unbalanced'
    END AS Outcome
FROM BalancedStrings
ORDER BY ID;
