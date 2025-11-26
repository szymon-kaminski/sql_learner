-- Puzzle #76 - Determine Batches

-- STEP 1: Create database
DROP DATABASE IF EXISTS puzzle76;
CREATE DATABASE puzzle76;
USE puzzle76;

-- STEP 2: Create tables
CREATE TABLE batch_start (
    Batch CHAR(1),
    BatchStart INT
);

CREATE TABLE batch_lines (
    Batch CHAR(1),
    LineNum INT,
    Syntax VARCHAR(200)
);


-- STEP 3: Insert data
INSERT INTO batch_start (Batch, BatchStart) VALUES
('A', 1),
('A', 5);

INSERT INTO batch_lines (Batch, LineNum, Syntax) VALUES
('A', 1, 'SELECT *'),
('A', 2, 'FROM Account;'),
('A', 3, 'GO'),
('A', 4, NULL),
('A', 5, 'TRUNCATE TABLE Accounts;'),
('A', 6, 'GO');
