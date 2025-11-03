-- Puzzle #66 — Matching Parts
-- Goal: group parts into sets (Bolt, Washer, Nut) by their manufacture day (earliest first).

-- STEP 1: Create database and base table
DROP DATABASE IF EXISTS puzzle66;
CREATE DATABASE puzzle66;
USE puzzle66;

DROP TABLE IF EXISTS Parts;
CREATE TABLE Parts (
    SerialNo VARCHAR(20) PRIMARY KEY,
    ManufactureDay INT,
    Product VARCHAR(20)
);


-- STEP 2: Insert sample data
INSERT INTO Parts (SerialNo, ManufactureDay, Product) VALUES
('A111', 1, 'Bolt'),
('B111', 3, 'Bolt'),
('C111', 5, 'Bolt'),
('D222', 2, 'Washer'),
('E222', 4, 'Washer'),
('F222', 6, 'Washer'),
('G333', 3, 'Nut'),
('H333', 5, 'Nut'),
('I333', 7, 'Nut');

-- Preview input
SELECT * FROM Parts ORDER BY ManufactureDay, Product;


-- STEP 3: Rank parts per product by ManufactureDay (earliest = 1)
WITH Ranked AS (
    SELECT
        SerialNo,
        ManufactureDay,
        Product,
        ROW_NUMBER() OVER (PARTITION BY Product ORDER BY ManufactureDay, SerialNo) AS rn
    FROM Parts
)
SELECT * FROM Ranked ORDER BY Product, rn;


-- STEP 4: Pivot / join sets by rank to produce (Bolt, Washer, Nut) rows
SELECT
    b.SerialNo AS Bolt,
    w.SerialNo AS Washer,
    n.SerialNo AS Nut
FROM
    (SELECT SerialNo, rn FROM Ranked WHERE Product = 'Bolt') AS b
LEFT JOIN
    (SELECT SerialNo, rn FROM Ranked WHERE Product = 'Washer') AS w
    ON b.rn = w.rn
LEFT JOIN
    (SELECT SerialNo, rn FROM Ranked WHERE Product = 'Nut') AS n
    ON b.rn = n.rn
ORDER BY b.rn;
