-- Puzzle #23: Divide in Half

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS Players;
CREATE TABLE Players (
    PlayerID INT,
    Score INT
);

INSERT INTO Players (PlayerID, Score) VALUES
(1001, 2343),
(2002, 9432),
(3003, 6548),
(4004, 1054),
(5005, 6832);

SELECT * FROM Players ORDER BY PlayerID, Score;