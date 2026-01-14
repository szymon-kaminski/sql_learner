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
INSERT INTO pascal_triangle (row_number, position, value)
VALUES (1, 1, 1);


-- STEP 3 - RECURSIVE CTE (CORE LOGIC)
WITH RECURSIVE pascal AS (
    -- base row
    SELECT
        1 AS row_number,
        1 AS position,
        1 AS value

    UNION ALL

    -- next rows
    SELECT
        p.row_number + 1,
        n.position,
        COALESCE(p.value, 0) + COALESCE(p2.value, 0)
    FROM pascal p
    JOIN (
        SELECT 1 AS position
        UNION ALL
        SELECT position + 1
        FROM pascal
    ) n
    LEFT JOIN pascal p2
        ON p2.row_number = p.row_number
       AND p2.position = n.position
    WHERE p.row_number < 10
)
INSERT INTO pascal_triangle
SELECT * FROM pascal;


-- STEP 4 - QUERY ANY POSITION
SELECT value
FROM pascal_triangle
WHERE row_number = 5
  AND position = 3;
