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


