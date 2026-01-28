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
