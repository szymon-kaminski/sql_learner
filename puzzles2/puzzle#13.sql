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


-- STEP 2 - BASE CASE (ROW 1)
INSERT INTO pascal_triangle (row_no, col_no, val)
VALUES (1, 1, 1);


-- STEP 3 - RECURSIVE CTE (CORE LOGIC)
WITH RECURSIVE pascal AS (
    -- base row
    SELECT
        1 AS row_no,
        1 AS col_no,
        1 AS val

    UNION ALL

    -- next rows
    SELECT
        p.row_no + 1,
        c.col_no,
        IFNULL(p.val, 0) + IFNULL(p2.val, 0)
    FROM pascal p
    JOIN (
        SELECT 1 AS col_no
        UNION ALL
        SELECT col_no + 1
        FROM pascal
    ) c
    LEFT JOIN pascal p2
        ON p2.row_no = p.row_no
       AND p2.col_no = c.col_no
    WHERE p.row_no < 10
)
INSERT INTO pascal_triangle
SELECT row_no, col_no, val
FROM pascal;


-- STEP 4 - QUERY ANY POSITION
SELECT val
FROM pascal_triangle
WHERE row_no = 5
  AND col_no = 3;
