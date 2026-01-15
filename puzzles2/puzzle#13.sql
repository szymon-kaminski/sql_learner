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


-- STEP 2 - RECURSIVE CTE (CORE LOGIC)
INSERT INTO pascal_triangle (row_no, col_no, val)
WITH RECURSIVE pascal AS (

    -- base row
    SELECT
        1 AS row_no,
        1 AS col_no,
        1 AS val

    UNION ALL

    SELECT
        CASE
            WHEN col_no < row_no THEN row_no
            ELSE row_no + 1
        END AS row_no,

        CASE
            WHEN col_no < row_no THEN col_no + 1
            ELSE 1
        END AS col_no,

        CASE
            WHEN col_no = 1 OR col_no = row_no THEN 1
            ELSE val * (row_no - col_no + 1) / col_no
        END AS val
    FROM pascal
    WHERE row_no < 10
)
SELECT row_no, col_no, val
FROM pascal;
