-- Puzzle #54 - Winning the Lottery

-- Step 1: Create database and tables
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

DROP TABLE IF EXISTS WinningNumbers;
DROP TABLE IF EXISTS Tickets;

CREATE TABLE WinningNumbers (
    Number INT
);

CREATE TABLE Tickets (
    TicketID VARCHAR(10),
    Number INT
);

INSERT INTO WinningNumbers (Number) VALUES
(25), (45), (78);

INSERT INTO Tickets (TicketID, Number) VALUES
('AAA', 25),
('AAA', 45),
('AAA', 78),
('BBB', 25),
('BBB', 45),
('BBB', 98),
('CCC', 67),
('CCC', 86),
('CCC', 91);
