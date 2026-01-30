-- Puzzle #17: Dice Throw Game

SET cte_max_recursion_depth = 20000;

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle17;
CREATE DATABASE puzzle17;
USE puzzle17;


-- STEP 1 - THROW LOG
CREATE TABLE throws (
    game_id INT,
    throw_no INT,
    dice INT,
    score INT,
    PRIMARY KEY (game_id, throw_no)
);
