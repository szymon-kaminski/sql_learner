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
