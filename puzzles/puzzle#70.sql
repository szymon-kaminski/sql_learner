-- Puzzle #70: Student Facts

-- Step 1 - Create database and table
CREATE DATABASE puzzle70;
USE puzzle70;

CREATE TABLE students (
    ParentID INT,
    ChildID CHAR(1),
    Age INT,
    Gender CHAR(1)
);

INSERT INTO students VALUES
(1001, 'A', 8, 'M'),
(1001, 'B', 12, 'F'),
(2002, 'C', 7, 'F'),
(2002, 'D', 9, 'F'),
(2002, 'E', 14, 'M'),
(3003, 'F', 12, 'F'),
(3003, 'G', 14, 'M'),
(4004, 'H', 7, 'M');

-- Verify input data
SELECT * FROM students;

-- Step 2 - Basic stats per parent
SELECT
    ParentID,
    COUNT(*) AS NumberChildren,
    ROUND(AVG(Age)) AS AverageAge,
    MAX(Age) - MIN(Age) AS AgeDifference,
    MIN(Age) AS YoungestAge,
    MAX(Age) AS OldestAge
FROM students
GROUP BY ParentID;


-- Step 3 - Calculate largest age gap between siblings
WITH ordered AS (
    SELECT
        ParentID,
        Age,
        LAG(Age) OVER (PARTITION BY ParentID ORDER BY Age) AS prev_age
    FROM students
)
SELECT
    ParentID,
    MAX(Age - prev_age) AS LargestAgeGap
FROM ordered
WHERE prev_age IS NOT NULL
GROUP BY ParentID;


-- Step 4 - Combine all stats into one result
WITH base AS (
    SELECT
        ParentID,
        COUNT(*) AS NumberChildren,
        ROUND(AVG(Age)) AS AverageAge,
        MAX(Age) - MIN(Age) AS AgeDifference,
        MIN(Age) AS YoungestAge,
        MAX(Age) AS OldestAge,
        GROUP_CONCAT(Gender ORDER BY Gender SEPARATOR ', ') AS Genders
    FROM students
    GROUP BY ParentID
),
gaps AS (
    SELECT
        ParentID,
        MAX(Age - prev_age) AS LargestAgeGap
    FROM (
        SELECT
            ParentID,
            Age,
            LAG(Age) OVER (PARTITION BY ParentID ORDER BY Age) AS prev_age
        FROM students
    ) t
    WHERE prev_age IS NOT NULL
    GROUP BY ParentID
)
SELECT
    b.ParentID,
    b.NumberChildren,
    b.AverageAge,
    b.AgeDifference,
    COALESCE(g.LargestAgeGap, 0) AS LargestAgeGap,
    b.YoungestAge,
    b.OldestAge,
    b.Genders
FROM base b
LEFT JOIN gaps g USING (ParentID)
ORDER BY b.ParentID;


-- test git hub nowy klucz