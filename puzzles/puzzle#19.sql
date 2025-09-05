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


-- Step 2: Sort periods and detect new groups
WITH OrderedPeriods AS (
    SELECT 
        StartDate,
        EndDate,
        LAG(EndDate) OVER (ORDER BY StartDate) AS PrevEnd
    FROM TimePeriods
),
MarkedGroups AS (
    SELECT
        StartDate,
        EndDate,
        CASE 
            WHEN PrevEnd IS NULL OR StartDate > DATE_ADD(PrevEnd, INTERVAL 0 DAY)
            THEN 1 ELSE 0 
        END AS NewGroup
    FROM OrderedPeriods
),
NumberedGroups AS (
    SELECT
        StartDate,
        EndDate,
        SUM(NewGroup) OVER (ORDER BY StartDate ROWS UNBOUNDED PRECEDING) AS GroupID
    FROM MarkedGroups
)