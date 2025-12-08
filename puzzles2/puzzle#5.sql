-- PUZZLE #5: Add the numbers up

-- STEP 1 - TABELA Z DANYMI
DROP TABLE IF EXISTS numbers;
CREATE TABLE numbers (
    n INT PRIMARY KEY
);

INSERT INTO numbers (n) VALUES (1), (2), (3);


-- STEP 2 - TABELA NA WYNIKI
DROP TABLE IF EXISTS results;
CREATE TABLE results (
    expression VARCHAR(100),
    total INT
);

-- STEP 3 - REKURENCYJNE GENEROWANIE WYRAŻEŃ
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

    SELECT
        -- konkatenacja
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

   