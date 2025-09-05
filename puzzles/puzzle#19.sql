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


-- Step 2 — Wykrywanie początków nowych grup przedziałów (przerwy w datach lub większe niż 1 dzień)
WITH MarkedGroups AS (
    SELECT 
        StartDate,
        EndDate,
        CASE 
            WHEN StartDate <= LAG(EndDate) OVER (ORDER BY StartDate)
            THEN 0
            ELSE 1
        END AS IsNewGroup
    FROM TimePeriods
)

-- Step 3 — Nadawanie numerów grup (sumowanie flag IsNewGroup)
, NumberedGroups AS (
    SELECT 
        StartDate,
        EndDate,
        SUM(IsNewGroup) OVER (ORDER BY StartDate) AS GroupID
    FROM MarkedGroups
)


-- Step 4: Merge intervals per group
SELECT 
    MIN(StartDate) AS StartDate,
    MAX(EndDate) AS EndDate
FROM NumberedGroups
GROUP BY GroupID
ORDER BY StartDate;