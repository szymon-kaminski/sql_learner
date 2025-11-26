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


-- STEP 4: Determine Batch Ends
-- Batch ends where Syntax = 'GO'
WITH ends AS (
    SELECT
        Batch,
        LineNum AS BatchEnd,
        ROW_NUMBER() OVER (PARTITION BY Batch ORDER BY LineNum) AS rn
    FROM batch_lines
    WHERE Syntax = 'GO'
),
starts AS (
    SELECT
        Batch,
        BatchStart,
        ROW_NUMBER() OVER (PARTITION BY Batch ORDER BY BatchStart) AS rn
    FROM batch_start
)

-- STEP 5: Match starts to ends and output final result
SELECT
    s.Batch,
    s.BatchStart,
    e.BatchEnd
FROM starts s
JOIN ends e
    ON s.Batch = e.Batch
    AND s.rn = e.rn
ORDER BY s.BatchStart;
