-- Puzzle #58 - Add Them Up

-- Step 1: Utworzenie tabeli i wstawienie danych
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

CREATE TABLE Equations (
    Equation VARCHAR(20)
);

INSERT INTO Equations (Equation) VALUES
('123'),
('1+2+3'),
('1+2-3'),
('1+23'),
('1-2+3'),
('1-2-3'),
('1-23'),
('12+3'),
('12-3');


-- Preview input data
SELECT * FROM Equations;


-- Step 2: Rozdzielenie liczb i operatorów
SELECT
    Equation,
    REGEXP_REPLACE(Equation, '[+-]', ' ') AS Cleaned
FROM Equations;


-- Step 3: Rozdzielenie liczb i operatorów przy pomocy CTE
WITH RECURSIVE SplitOperators AS (
    SELECT
        Equation,
        1 AS pos,
        SUBSTRING(Equation, 1, 1) AS ch
    FROM Equations

    UNION ALL

    SELECT
        Equation,
        pos + 1,
        SUBSTRING(Equation, pos + 1, 1)
    FROM SplitOperators
    WHERE pos < LENGTH(Equation)
),
Parsed AS (
    SELECT
        Equation,
        GROUP_CONCAT(
            CASE
                WHEN ch IN ('+', '-') THEN CONCAT(' ', ch, ' ')
                ELSE ch
            END
            ORDER BY pos SEPARATOR ''
        ) AS Expression
    FROM SplitOperators
    GROUP BY Equation
),
Evaluate AS (
    SELECT
        Equation,
        Expression,
        SUM(
            CASE
                WHEN SUBSTRING_INDEX(SUBSTRING_INDEX(Expression, ' ', n.n), ' ', -1) = '+' THEN 0
                WHEN SUBSTRING_INDEX(SUBSTRING_INDEX(Expression, ' ', n.n), ' ', -1) = '-' THEN 0
                ELSE CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(Expression, ' ', n.n), ' ', -1) AS SIGNED)
            END
        ) AS SumValue
    FROM Parsed
    JOIN (
        SELECT a.N + b.N * 10 AS n
        FROM (
            SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
            UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
        ) a
        CROSS JOIN (
            SELECT 0 AS N UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4
            UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9
        ) b
    ) n
    ON n.n <= 1 + LENGTH(Expression) - LENGTH(REPLACE(Expression, ' ', ''))
    GROUP BY Equation, Expression
)
SELECT
    Equation AS Permutation,
    SumValue AS Sum
FROM Evaluate
ORDER BY Equation;

