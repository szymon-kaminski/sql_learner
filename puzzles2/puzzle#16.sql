-- Puzzle #16: Monty Hall Simulation

SET cte_max_recursion_depth = 10000;

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


-- STEP 3 — COMPUTE RESULTS (SEDNO LOGIKI)
UPDATE simulations
SET
    stay_win = (chosen_door = prize_door),
    switch_win = (chosen_door <> prize_door);


-- STEP 4 — STATYSTYKA
SELECT
    COUNT(*) AS total_games,

    SUM(stay_win) AS stay_wins,
    ROUND(SUM(stay_win) / COUNT(*) * 100, 2) AS stay_win_pct,

    SUM(switch_win) AS switch_wins,
    ROUND(SUM(switch_win) / COUNT(*) * 100, 2) AS switch_win_pct
FROM simulations;
