-- Puzzle #22: Occurrences

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS Logs;
CREATE TABLE Logs (
    Workflow VARCHAR(50),
    Message VARCHAR(100),
    Occurrences INT
);

INSERT INTO Logs VALUES
('Bravo',   'Error: Cannot Divide by 0', 3),
('Alpha',   'Error: Conversion Failed', 5),
('Charlie', 'Error: Conversion Failed', 7),
('Alpha',   'Error: Unidentified error occurred', 9),
('Bravo',   'Error: Unidentified error occurred', 1),
('Charlie', 'Error: Unidentified error occurred', 10),
('Charlie', 'Status Complete', 8);
