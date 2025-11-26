-- Puzzle #75 - Symmetric Matches

-- Step 1: Create database
DROP DATABASE IF EXISTS puzzle75;
CREATE DATABASE puzzle75;
USE puzzle75;


-- Step 2: Create table
CREATE TABLE boxes (
    BoxID CHAR(1),
    Length INT,
    Width INT,
    Height INT
);


-- Step 3: Insert sample data
INSERT INTO boxes (BoxID, Length, Width, Height) VALUES
('A', 10, 25, 15),
('B', 15, 10, 25),
('C', 10, 15, 25),
('D', 20, 30, 30),
('E', 30, 30, 20);

-- Preview input data
SELECT * FROM boxes;


-- Step 4: Normalize dimensions using LEAST + GREATEST
WITH normalized AS (
    SELECT
        BoxID,
        LEAST(Length, Width, Height) AS dim1,
        (Length + Width + Height)
            - LEAST(Length, Width, Height)
            - GREATEST(Length, Width, Height) AS dim2,
        GREATEST(Length, Width, Height) AS dim3
    FROM boxes
)

-- Step 6: Final result
SELECT *
FROM groups
ORDER BY BoxID;
