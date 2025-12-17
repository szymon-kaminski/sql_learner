-- Puzzle #9 - Find the Spaces

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle9;
CREATE DATABASE puzzle9;
USE puzzle9;


-- STEP 1 - INPUT TABLE
CREATE TABLE statements (
    id INT PRIMARY KEY,
    stmt VARCHAR(200)
);

INSERT INTO statements VALUES
(1, 'SELECT EmpID FROM Emps;'),
(2, 'SELECT * FROM Trans;');


-- STEP 2 - NUMBERS (TALLY TABLE)
CREATE TABLE numbers (n INT PRIMARY KEY);

INSERT INTO numbers (n)
WITH RECURSIVE cte AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM cte WHERE n < 200
)
SELECT n FROM cte;


-- STEP 3 - WORD DETECTION (CORE LOGIC)
WITH word_starts AS (
    SELECT
        s.id,
        s.stmt,
        n.n AS start_pos
    FROM statements s
    JOIN numbers n
      ON n.n <= CHAR_LENGTH(s.stmt)
    WHERE
        (n.n = 1 AND SUBSTRING(s.stmt, 1, 1) <> ' ')
        OR (
            SUBSTRING(s.stmt, n.n, 1) <> ' '
            AND SUBSTRING(s.stmt, n.n - 1, 1) = ' '
        )
),
words AS (
    SELECT
        id,
        stmt,
        start_pos,
        SUBSTRING_INDEX(
            SUBSTRING(stmt, start_pos),
            ' ',
            1
        ) AS word
    FROM word_starts
)
SELECT
    ROW_NUMBER() OVER (PARTITION BY id ORDER BY start_pos) AS RowNumber,
    id,
    stmt AS String,
    start_pos AS Starts,
    CASE
        WHEN LOCATE(' ', SUBSTRING(stmt, start_pos)) = 0 THEN 0
        ELSE start_pos + LOCATE(' ', SUBSTRING(stmt, start_pos)) - 2
    END AS Position,
    word AS Word,
    CHAR_LENGTH(stmt) - CHAR_LENGTH(REPLACE(stmt, ' ', '')) AS TotalSpaces
FROM words
ORDER BY id, RowNumber;


