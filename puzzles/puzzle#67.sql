-- Puzzle 67: Matching birthdays

-- Step 1: Utwórz bazę i tabelę
CREATE DATABASE IF NOT EXISTS puzzle67;
USE puzzle67;

CREATE TABLE IF NOT EXISTS Students (
    Student VARCHAR(50),
    Birthday DATE
);


-- Step 2: Wstaw dane
INSERT INTO Students (Student, Birthday) VALUES
('Susan', '2015-04-15'),
('Tim', '2015-04-15'),
('Jacob', '2015-04-15'),
('Earl', '2015-02-05'),
('Mike', '2015-05-23'),
('Angie', '2015-05-23'),
('Jenny', '2015-11-19'),
('Michelle', '2015-12-12'),
('Aaron', '2015-12-18');

-- Preview input data
SELECT * FROM Students;


-- Step 3: Grupowanie po dacie i łączenie imion
SELECT
    DATE_FORMAT(Birthday, '%m/%d/%Y') AS Birthday,
    GROUP_CONCAT(Student ORDER BY Student SEPARATOR ', ') AS Students
FROM Students
GROUP BY Birthday
HAVING COUNT(*) > 1
ORDER BY Birthday;
