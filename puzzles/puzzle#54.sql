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

-- preview data
SELECT * FROM WinningNumbers;
SELECT * FROM Tickets;


-- Step 2: Count matches for each ticket
WITH MatchCounts AS (
    SELECT 
        t.TicketID,
        COUNT(w.Number) AS MatchCount
    FROM Tickets t
    LEFT JOIN WinningNumbers w
        ON t.Number = w.Number
    GROUP BY t.TicketID
),


-- Step 3: Assign prize per ticket
Prizes AS (
    SELECT 
        TicketID,
        CASE
            WHEN MatchCount = (SELECT COUNT(*) FROM WinningNumbers) THEN 100
            WHEN MatchCount BETWEEN 1 AND (SELECT COUNT(*) FROM WinningNumbers) - 1 THEN 10
            ELSE 0
        END AS Prize
    FROM MatchCounts
)


-- Step 4: Calculate total winnings
SELECT CONCAT('$', SUM(Prize)) AS Amount
FROM Prizes;
