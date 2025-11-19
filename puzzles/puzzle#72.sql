-- Puzzle #72 - Under Warranty

DROP DATABASE IF EXISTS puzzle72;
CREATE DATABASE puzzle72;
USE puzzle72;


-- STEP 1 — Create table + insert data

CREATE TABLE Repairs (
    RepairID INT PRIMARY KEY,
    CustomerID CHAR(1),
    RepairDate DATE
);

INSERT INTO Repairs (RepairID, CustomerID, RepairDate) VALUES
(1001, 'A', '2023-01-01'),
(2002, 'A', '2023-01-15'),
(3003, 'A', '2023-01-17'),
(4004, 'A', '2023-03-24'),
(5005, 'A', '2023-04-01'),
(6006, 'B', '2023-06-22'),
(7007, 'B', '2023-06-23'),
(8008, 'B', '2023-09-01');

-- Preview input data
SELECT * FROM Repairs ORDER BY CustomerID, RepairDate;

-- STEP 2 — Sort repairs per customer and assign row numbers
WITH ordered AS (
    SELECT
        RepairID,
        CustomerID,
        RepairDate,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY RepairDate) AS rn
    FROM Repairs
)
SELECT * FROM ordered;

-- STEP 3 — Join each repair with its previous repair

WITH ordered AS (
    SELECT
        RepairID,
        CustomerID,
        RepairDate,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY RepairDate) AS rn
    FROM Repairs
),
paired AS (
    SELECT
        cur.CustomerID,
        cur.RepairID,
        prev.RepairID AS PreviousRepairID,
        cur.RepairDate,
        prev.RepairDate AS PreviousRepairDate,
        cur.rn - 1 AS SequenceNumber,
        DATEDIFF(cur.RepairDate, prev.RepairDate) AS RepairGapDays
    FROM ordered cur
    LEFT JOIN ordered prev
        ON cur.CustomerID = prev.CustomerID
       AND cur.rn = prev.rn + 1
)
SELECT * FROM paired;


-- STEP 4 — Filter to warranty repairs (gap ≤ 30)
 WITH ordered AS (
    SELECT
        RepairID,
        CustomerID,
        RepairDate,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY RepairDate) AS rn
    FROM Repairs
),
paired AS (
    SELECT
        cur.CustomerID,
        cur.RepairID,
        prev.RepairID AS PreviousRepairID,
        cur.RepairDate,
        prev.RepairDate AS PreviousRepairDate,
        cur.rn - 1 AS SequenceNumber,
        DATEDIFF(cur.RepairDate, prev.RepairDate) AS RepairGapDays
    FROM ordered cur
    LEFT JOIN ordered prev
        ON cur.CustomerID = prev.CustomerID
       AND cur.rn = prev.rn + 1
)
SELECT * FROM paired
WHERE RepairGapDays <= 30;


-- FINAL RESULT — Format output exactly like expected

WITH ordered AS (
    SELECT
        RepairID,
        CustomerID,
        RepairDate,
        ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY RepairDate) AS rn
    FROM Repairs
),
paired AS (
    SELECT
        cur.CustomerID,
        cur.RepairID,
        prev.RepairID AS PreviousRepairID,
        cur.RepairDate,
        prev.RepairDate AS PreviousRepairDate,
        cur.rn - 1 AS SequenceNumber,
        DATEDIFF(cur.RepairDate, prev.RepairDate) AS RepairGapDays
    FROM ordered cur
    LEFT JOIN ordered prev
        ON cur.CustomerID = prev.CustomerID
       AND cur.rn = prev.rn + 1
)
SELECT
    CustomerID,
    RepairID,
    PreviousRepairID,
    DATE_FORMAT(RepairDate, '%m/%d/%Y') AS RepairDate,
    DATE_FORMAT(PreviousRepairDate, '%m/%d/%Y') AS PreviousRepairDate,
    SequenceNumber,
    RepairGapDays
FROM paired
WHERE RepairGapDays <= 30
ORDER BY CustomerID, RepairDate;