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
