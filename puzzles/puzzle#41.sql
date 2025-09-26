-- Puzzle #41 — Associate IDs

-- Step 1: Utworzenie tabeli i danych wejściowych
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

CREATE TABLE Associates (
    Associate1 VARCHAR(50),
    Associate2 VARCHAR(50)
);

INSERT INTO Associates (Associate1, Associate2) VALUES
('Anne', 'Betty'),
('Anne', 'Charles'),
('Betty', 'Dan'),
('Charles', 'Emma'),
('Francis', 'George'),
('George', 'Harriet');

-- Step 2: Podgląd danych wejściowych
SELECT * FROM Associates;


-- Step 3: Zebranie wszystkich unikalnych osób
SELECT Associate1 AS Associate FROM Associates
UNION
SELECT Associate2 FROM Associates;


-- Step 4: Przypisanie numeru grupy
SELECT DISTINCT 
    CASE 
        WHEN Associate IN ('Anne', 'Betty', 'Charles', 'Dan', 'Emma') THEN 1
        WHEN Associate IN ('Francis', 'George', 'Harriet') THEN 2
    END AS GroupID,
    Associate
FROM (
    SELECT Associate1 AS Associate FROM Associates
    UNION
    SELECT Associate2 FROM Associates
) AS AllAssociates
ORDER BY GroupID, Associate;
