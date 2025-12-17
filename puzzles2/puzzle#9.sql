-- Puzzle #9 - Find the Spaces

-- STEP 0 - DATABASE
DROP DATABASE IF EXISTS puzzle9;
CREATE DATABASE puzzle9;
USE puzzle9;


-- STEP 1 - INPUT TABLE
CREATE TABLE statements (
    id INT PRIMARY KEY,
    stmt VARCHAR(200)
);

INSERT INTO statements VALUES
(1, 'SELECT EmpID FROM Emps;'),
(2, 'SELECT * FROM Trans;');
