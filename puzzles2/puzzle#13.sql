-- Puzzle#13: Pascal's Triangle

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle13;
CREATE DATABASE puzzle13;
USE puzzle13;


-- STEP 1 - OUTPUT TABLE
CREATE TABLE pascal_triangle (
    row_no INT NOT NULL,
    col_no INT NOT NULL,
    val INT NOT NULL,
    PRIMARY KEY (row_no, col_no)
);
