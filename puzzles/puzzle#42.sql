-- Puzzle #42: Mutual Friends

-- Step 1: Create base table and insert data
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS Friends42;
CREATE TABLE Friends42 (
    Friend1 VARCHAR(50),
    Friend2 VARCHAR(50)
);

INSERT INTO Friends42 (Friend1, Friend2) VALUES
('Jason', 'Mary'),
('Mike',  'Mary'),
('Mike',  'Jason'),
('Susan', 'Jason'),
('John',  'Mary'),
('Susan', 'Mary');

-- Preview input data
SELECT * FROM Friends42;


-- Step 2: Build distinct unordered pairs that appear in the data
-- We use LEAST/GREATEST to normalize pair order (avoid duplicates like (A,B) and (B,A))
SELECT DISTINCT
    LEAST(Friend1, Friend2) AS FriendA,
    GREATEST(Friend1, Friend2) AS FriendB
FROM Friends42
ORDER BY FriendA, FriendB;


-- Step 3: For each pair count mutual friends
-- Mutual friends = count of distinct X such that X -> FriendA AND X -> FriendB
SELECT
    p.FriendA AS `Friend 1`,
    p.FriendB AS `Friend 2`,
    (
      SELECT COUNT(DISTINCT f3.Friend1)
      FROM Friends42 f3
      WHERE f3.Friend2 = p.FriendA
        AND f3.Friend1 IN (
            SELECT f4.Friend1
            FROM Friends42 f4
            WHERE f4.Friend2 = p.FriendB
        )
    ) AS MutualFriends
FROM (
    SELECT DISTINCT
        LEAST(Friend1, Friend2) AS FriendA,
        GREATEST(Friend1, Friend2) AS FriendB
    FROM Friends42
) p
ORDER BY `Friend 1`, `Friend 2`;

