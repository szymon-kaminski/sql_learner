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
