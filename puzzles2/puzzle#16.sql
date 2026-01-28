-- Puzzle #16: Monty Hall Simulation

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle16;
CREATE DATABASE puzzle16;
USE puzzle16;


-- STEP 1 - SIMULATION TABLE
CREATE TABLE simulations (
    sim_id INT PRIMARY KEY,
    prize_door INT,
    chosen_door INT,
    switch_win BOOLEAN,
    stay_win BOOLEAN
);


-- STEP 2 - GENERATE 10,000 SIMULATIONS
INSERT INTO simulations
WITH RECURSIVE seq AS (
    SELECT 1 AS sim_id
    UNION ALL
    SELECT sim_id + 1
    FROM seq
    WHERE sim_id < 10000
)
SELECT
    sim_id,

    FLOOR(1 + RAND() * 3) AS prize_door,
    FLOOR(1 + RAND() * 3) AS chosen_door,

    -- switching wins if initial choice was wrong
    CASE
        WHEN FLOOR(1 + RAND() * 3) <> FLOOR(1 + RAND() * 3) THEN NULL
        ELSE NULL
    END AS switch_win,  -- placeholder (fixed below)

    NULL AS stay_win
FROM seq;
