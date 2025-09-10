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

SELECT * FROM Logs ORDER BY Workflow, Message;

-- Step 2: Aggregate total occurrences per workflow and message
WITH Aggregated AS (
    SELECT 
        Workflow,
        Message,
        SUM(Occurrences) AS TotalOcc
    FROM Logs
    GROUP BY Workflow, Message
),


-- Step 3: Find max occurrence per message
MaxPerMessage AS (
    SELECT 
        Message,
        MAX(TotalOcc) AS MaxOcc
    FROM Aggregated
    GROUP BY Message
)


-- Step 4: Keep only workflow(s) that match the max per message
SELECT 
    a.Workflow,
    a.Message,
    a.TotalOcc AS Occurrences
FROM Aggregated a
JOIN MaxPerMessage m 
  ON a.Message = m.Message AND a.TotalOcc = m.MaxOcc
ORDER BY a.Message;
