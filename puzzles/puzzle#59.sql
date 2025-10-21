-- Puzzle #59 — Balanced String

-- Step 1: Create database and table
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS BalancedStrings;

CREATE TABLE BalancedStrings (
    ID INT PRIMARY KEY,
    String VARCHAR(50)
);