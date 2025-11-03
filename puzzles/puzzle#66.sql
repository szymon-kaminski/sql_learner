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
