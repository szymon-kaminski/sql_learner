-- PUZZLE #5: Add the numbers up

-- STEP 0 — BAZA
CREATE DATABASE IF NOT EXISTS puzzle5;
USE puzzle5;

-- STEP 1 — TABELA Z LICZBAMI
DROP TABLE IF EXISTS numbers;
CREATE TABLE numbers (
    n INT PRIMARY KEY
);

INSERT INTO numbers (n) VALUES (1), (2), (3);

-- STEP 2 — TABELA WYNIKOWA
DROP TABLE IF EXISTS results;
CREATE TABLE results (
    expression VARCHAR(100),
    total INT
);

-- STEP 3 — INSERT + CTE 
INSERT INTO results (expression, total)
WITH RECURSIVE cte AS (
    -- start od pierwszej liczby
    SELECT 
        CAST(n AS CHAR(50)) AS expr,
        CAST(n AS SIGNED) AS total,
        n AS last_num,
        1 AS pos
    FROM numbers
    WHERE n = 1

    UNION ALL

    -- sklejenie
    SELECT
        CONCAT(expr, n.n),
        CASE 
            WHEN last_num >= 0 
            THEN total - last_num + CAST(CONCAT(last_num, n.n) AS SIGNED)
            ELSE total - last_num - CAST(CONCAT(ABS(last_num), n.n) AS SIGNED)
        END,
        CASE 
            WHEN last_num >= 0 
            THEN CAST(CONCAT(last_num, n.n) AS SIGNED)
            ELSE -CAST(CONCAT(ABS(last_num), n.n) AS SIGNED)
        END,
        pos + 1
    FROM cte
    JOIN numbers n ON n.n = pos + 1

    UNION ALL

    -- plus
    SELECT
        CONCAT(expr, '+', n.n),
        total + n.n,
        n.n,
        pos + 1
    FROM cte
    JOIN numbers n ON n.n = pos + 1

    UNION ALL

    -- minus
    SELECT
        CONCAT(expr, '-', n.n),
        total - n.n,
        -n.n,
        pos + 1
    FROM cte
    JOIN numbers n ON n.n = pos + 1
)
SELECT expr, total
FROM cte
WHERE pos = (SELECT COUNT(*) FROM numbers);

-- STEP 4 — PODGLĄD
SELECT * FROM results ORDER BY expression;

