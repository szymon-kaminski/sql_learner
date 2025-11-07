-- Puzzle #69 - Splitting a Hierarchy

-- STEP 1: Create database and table
CREATE DATABASE IF NOT EXISTS puzzle69;
USE puzzle69;

CREATE TABLE hierarchy (
    Parent CHAR(1),
    Child CHAR(1)
);

INSERT INTO hierarchy (Parent, Child) VALUES
('A','B'),
('A','C'),
('B','D'),
('B','E'),
('C','F'),
('D','G');

-- STEP 2: Verify input data
SELECT * FROM hierarchy;


-- STEP 3: Build recursive hierarchy expansion
WITH RECURSIVE hierarchy_cte AS (
    SELECT Parent, Child, Parent AS Root
    FROM hierarchy
    WHERE Parent = 'A'
    
    UNION ALL
    
    SELECT h.Parent, h.Child, cte.Root
    FROM hierarchy h
    JOIN hierarchy_cte cte
      ON h.Parent = cte.Child
)
SELECT * FROM hierarchy_cte;


-- STEP 4: Assign groups based on hierarchy
WITH RECURSIVE hierarchy_cte AS (
    SELECT Parent, Child, Parent AS Root
    FROM hierarchy
    WHERE Parent = 'A'
    
    UNION ALL
    
    SELECT h.Parent, h.Child, cte.Root
    FROM hierarchy h
    JOIN hierarchy_cte cte
      ON h.Parent = cte.Child
),
group_split AS (
    SELECT DISTINCT 
        CASE 
            WHEN Child IN ('B','D','E','G') THEN 'Group A'
            WHEN Child IN ('C','F') THEN 'Group B'
        END AS `Group`,
        Child AS ID
    FROM hierarchy_cte
    
    UNION ALL
    SELECT 'Group A', 'A'
    UNION ALL
    SELECT 'Group B', 'A'
)
SELECT * FROM group_split ORDER BY `Group`, ID;


-- STEP 5: Create final view for simplified output
CREATE OR REPLACE VIEW hierarchy_groups AS
WITH RECURSIVE hierarchy_cte AS (
    SELECT Parent, Child, Parent AS Root
    FROM hierarchy
    WHERE Parent = 'A'
    
    UNION ALL
    
    SELECT h.Parent, h.Child, cte.Root
    FROM hierarchy h
    JOIN hierarchy_cte cte
      ON h.Parent = cte.Child
)
SELECT DISTINCT 
    CASE 
        WHEN Child IN ('B','D','E','G') THEN 'Group A'
        WHEN Child IN ('C','F') THEN 'Group B'
    END AS `Group`,
    Child AS ID
FROM hierarchy_cte
UNION ALL
SELECT 'Group A', 'A'
UNION ALL
SELECT 'Group B', 'A';

-- To display final result:
SELECT * FROM hierarchy_groups ORDER BY `Group`, ID;