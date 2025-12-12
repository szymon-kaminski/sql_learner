-- PUZZLE #8: Four Vehicles Problem 
-- Generate all assignments of 10 people (A1..A5 adults, C1..C5 children)
-- into vehicles: motorcycle(1), sidecar(2), golf_cart(3), car(4)
-- Conditions:
--  * seating order inside each vehicle does NOT matter (combinations)
--  * each vehicle must contain at least one adult
-- Expected total rows: 7,200

-- STEP 0 - BAZA
DROP DATABASE IF EXISTS puzzle8;
CREATE DATABASE puzzle8;
USE puzzle8;


-- STEP 1 - PEOPLE
DROP TABLE IF EXISTS people;
CREATE TABLE people (
    id INT PRIMARY KEY,
    name VARCHAR(10),
    is_adult TINYINT(1)
);

-- insert 5 adults A1..A5 and 5 children C1..C5
TRUNCATE TABLE people;
INSERT INTO people (id, name, is_adult) VALUES
(1, 'A1', 1),
(2, 'A2', 1),
(3, 'A3', 1),
(4, 'A4', 1),
(5, 'A5', 1),
(6, 'C1', 0),
(7, 'C2', 0),
(8, 'C3', 0),
(9, 'C4', 0),
(10,'C5', 0);


-- STEP 2 - OUTPUT TABLE
DROP TABLE IF EXISTS assignments;
CREATE TABLE assignments (
    motorcycle VARCHAR(10),
    sidecar VARCHAR(50),
    golf_cart VARCHAR(100),
    car VARCHAR(200),
    permutation VARCHAR(400),
    PRIMARY KEY (permutation)
);


-- STEP 3 - MAIN GENERATION USING SELF-JOINS
-- Strategy:
-- 1) choose motorcycle (m)
-- 2) choose unordered pair for sidecar (s1 < s2), excluding m
-- 3) choose unordered triple for golf_cart (g1 < g2 < g3), excluding previous
-- 4) remaining 4 people go to car (order inside car doesn't matter)
-- Enforce: each vehicle group contains at least 1 adult

INSERT INTO assignments (motorcycle, sidecar, golf_cart, car, permutation)
SELECT
    m.name AS motorcycle,
    -- sidecar members sorted by id
    CONCAT(s1.name, ',', s2.name) AS sidecar,
    -- golf cart members sorted by id
    CONCAT(g1.name, ',', g2.name, ',', g3.name) AS golf_cart,
    -- car is "the rest" - build via subquery and ordered by id
    car_members.car_list AS car,
    -- permutation text (composed) used as PK
    CONCAT(
      m.name, ' | ',
      CONCAT(s1.name, ',', s2.name), ' | ',
      CONCAT(g1.name, ',', g2.name, ',', g3.name), ' | ',
      car_members.car_list
    ) AS permutation
FROM people m
-- sidecar: choose two distinct people s1 < s2, not equal m
JOIN people s1 ON s1.id <> m.id
JOIN people s2 ON s2.id > s1.id AND s2.id <> m.id

-- golf cart: choose three distinct people g1 < g2 < g3, none equal to m, s1, s2
JOIN people g1 ON g1.id NOT IN (m.id, s1.id, s2.id)
JOIN people g2 ON g2.id > g1.id AND g2.id NOT IN (m.id, s1.id, s2.id)
JOIN people g3 ON g3.id > g2.id AND g3.id NOT IN (m.id, s1.id, s2.id)

-- compute car members as remaining 4 people using correlated subquery
JOIN (
    SELECT
      -- placeholder columns to allow join: produce car_list for given chosen set via variables below
      p1 AS p1, p2 AS p2, p3 AS p3, p4 AS p4, p5 AS p5, p6 AS p6,
      -- actual car list will be computed in WHERE of outer query using these fields
      '' AS car_list
    FROM (
      SELECT 1 AS p1 -- no effect; this sub-subselect exists to satisfy syntax for join
    ) AS dummy
) AS car_placeholder ON 1=1

-- We will filter combinations and compute car_list in HAVING via GROUP_CONCAT
-- But MySQL doesn't allow direct use of correlated aggregates in SELECT with many joins,
-- so we handle car_list using a correlated scalar subquery in SELECT list.
CROSS JOIN LATERAL (
    SELECT GROUP_CONCAT(p.name ORDER BY p.id SEPARATOR ',') AS car_list
    FROM people p
    WHERE p.id NOT IN (m.id, s1.id, s2.id, g1.id, g2.id, g3.id)
) AS car_members

-- Apply constraints:
--  * ensure each vehicle group contains at least one adult
WHERE
    -- motorcycle must be adult
    m.is_adult = 1
    -- sidecar must contain at least one adult
    AND ( (SELECT COUNT(*) FROM people x WHERE x.id IN (s1.id, s2.id) AND x.is_adult = 1) >= 1 )
    -- golf cart must contain at least one adult
    AND ( (SELECT COUNT(*) FROM people x WHERE x.id IN (g1.id, g2.id, g3.id) AND x.is_adult = 1) >= 1 )
    -- car (remaining 4) must contain at least one adult
    AND ( (SELECT COUNT(*) FROM people x WHERE x.id NOT IN (m.id, s1.id, s2.id, g1.id, g2.id, g3.id) AND x.is_adult = 1) >= 1 )
;


-- STEP 4 - FINAL CHECK / PODGLĄD
-- Count rows and sample
SELECT COUNT(*) AS total_assignments FROM assignments;
SELECT * FROM assignments ORDER BY permutation LIMIT 20;
