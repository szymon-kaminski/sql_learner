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


-- STEP 2 - SIMULATE 1000 GAMES
INSERT INTO throws
WITH RECURSIVE games AS (
    SELECT 1 AS game_id
    UNION ALL
    SELECT game_id + 1 FROM games WHERE game_id < 1000
),
play AS (
    -- first throw
    SELECT
        g.game_id,
        1 AS throw_no,
        FLOOR(1 + RAND() * 6) AS dice,
        0 AS score
    FROM games g

    UNION ALL

    SELECT
        p.game_id,
        p.throw_no + 1,
        FLOOR(1 + RAND() * 6) AS dice,

        GREATEST(
            0,
            p.score +
            CASE
                WHEN p.dice BETWEEN 1 AND 5 THEN p.dice
                ELSE -p.dice
            END
        ) AS score

    FROM play p
    WHERE p.score < 100
)
SELECT
    game_id,
    throw_no,
    dice,
    score
FROM play;
