-- Puzzle #14: Josephus Problem

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle14;
CREATE DATABASE puzzle14;
USE puzzle14;


-- STEP 1 - PARAMETERS
Parametry problemu (łatwa zmiana bez ruszania logiki).
CREATE TABLE params (
    n INT,
    k INT
);

INSERT INTO params VALUES (7, 3);


-- STEP 2 - RECURSIVE ELIMINATION (CORE LOGIC)
WITH RECURSIVE josephus AS (
    -- base case
    SELECT
        n,
        k,
        1 AS step_no,
        n AS people_left,
        0 AS current_pos
    FROM params

    UNION ALL

    -- recursive elimination
    SELECT
        j.n,
        j.k,
        step_no + 1,
        people_left - 1,
        (current_pos + k) % people_left
    FROM josephus j
    WHERE people_left > 1
)
SELECT *
FROM josephus;


-- STEP 3 - FINAL WINNER
WITH RECURSIVE josephus AS (
    SELECT
        n,
        k,
        n AS people_left,
        0 AS current_pos
    FROM params

    UNION ALL

    SELECT
        j.n,
        j.k,
        people_left - 1,
        (current_pos + k) % people_left
    FROM josephus j
    WHERE people_left > 1
)
SELECT current_pos + 1 AS winner
FROM josephus
ORDER BY people_left
LIMIT 1;
