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