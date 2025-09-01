-- Puzzle #13

-- Step 1 — Create the table and insert data

USE sql_learner;

DROP TABLE IF EXISTS Inventory;
CREATE TABLE Inventory (
    Date DATE,
    QuantityAdjustment INT
);

INSERT INTO Inventory (Date, QuantityAdjustment)
VALUES 
('2018-07-01', 100),
('2018-07-02', 75),
('2018-07-03', -150),
('2018-07-04', 50),
('2018-07-05', -100);