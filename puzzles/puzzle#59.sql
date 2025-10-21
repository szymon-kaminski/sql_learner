-- Puzzle #59 — Balanced String

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS BalancedStrings;

CREATE TABLE BalancedStrings (
    ID INT PRIMARY KEY,
    String VARCHAR(50)
);

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
