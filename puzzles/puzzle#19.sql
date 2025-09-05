-- Puzzle #19

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS TimePeriods;
CREATE TABLE TimePeriods (
    StartDate DATE,
    EndDate DATE
);

INSERT INTO TimePeriods (StartDate, EndDate) VALUES
('2018-01-01', '2018-01-03'),
('2018-01-05', '2018-01-09'),
('2018-01-10', '2018-01-11'),
('2018-01-12', '2018-01-16'),
('2018-01-15', '2018-01-19');