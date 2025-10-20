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
        SUBSTRING(Equation, 1, 1) AS char
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
                WHEN char IN ('+', '-') THEN CONCAT(' ', char, ' ')
                ELSE char
            END
            ORDER BY pos SEPARATOR ''
        ) AS Expression
    FROM SplitOperators
    GROUP BY Equation
)
SELECT * FROM Parsed;
