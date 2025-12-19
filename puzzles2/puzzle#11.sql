-- Puzzle #11 - Count the Groupings

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle11;
CREATE DATABASE puzzle11;
USE puzzle11;


-- STEP 1 - INPUT TABLE
CREATE TABLE process_steps (
    step_number INT PRIMARY KEY,
    status VARCHAR(10)
);

INSERT INTO process_steps VALUES
(1,'Passed'),
(2,'Passed'),
(3,'Passed'),
(4,'Passed'),
(5,'Failed'),
(6,'Failed'),
(7,'Failed'),
(8,'Failed'),
(9,'Failed'),
(10,'Passed'),
(11,'Passed'),
(12,'Passed');


-- STEP 2 - DETECT CHANGE POINTS
WITH changes AS (
    SELECT
        step_number,
        status,
        CASE
            WHEN status <> LAG(status) OVER (ORDER BY step_number)
                 OR LAG(status) OVER (ORDER BY step_number) IS NULL
            THEN 1
            ELSE 0
        END AS is_new_group
    FROM process_steps
)


-- STEP 3 - ASSIGN GROUP ID
, grouped AS (
    SELECT
        step_number,
        status,
        SUM(is_new_group) OVER (ORDER BY step_number) AS group_id
    FROM changes
)


-- STEP 4 - FINAL AGGREGATION (EXPECTED OUTPUT)
SELECT
    MIN(step_number) AS min_step_number,
    MAX(step_number) AS max_step_number,
    status,
    COUNT(*) AS consecutive_count
FROM grouped
GROUP BY group_id, status
ORDER BY min_step_number;
