-- Puzzle #18

-- Step 1 — Create table and insert sample data

USE sql_learner;

DROP TABLE IF EXISTS SeatingChart;
CREATE TABLE SeatingChart (
    SeatNumber INT
);

INSERT INTO SeatingChart (SeatNumber) VALUES
(7),(13),(14),(15),(27),(28),(29),(30),
(31),(32),(33),(34),(35),(52),(53),(54);