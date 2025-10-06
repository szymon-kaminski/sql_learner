-- Puzzle #47 - Work Schedule

-- Step 1
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

CREATE TABLE Schedule (
  ScheduleID CHAR(1),
  StartTime DATETIME,
  EndTime DATETIME
);

CREATE TABLE Activity (
  ScheduleID CHAR(1),
  Activity VARCHAR(20),
  StartTime DATETIME,
  EndTime DATETIME
);

INSERT INTO Schedule VALUES
('A', '2021-10-01 10:00', '2021-10-01 15:00'),
('B', '2021-10-01 10:15', '2021-10-01 12:15');

INSERT INTO Activity VALUES
('A', 'Meeting', '2021-10-01 10:00', '2021-10-01 10:30'),
('A', 'Break',   '2021-10-01 12:00', '2021-10-01 12:30'),
('A', 'Meeting', '2021-10-01 13:00', '2021-10-01 13:30'),
('B', 'Break',   '2021-10-01 11:00', '2021-10-01 11:15');


-- Step 2
WITH timeline AS (
  SELECT ScheduleID, StartTime AS point_time FROM Activity
  UNION ALL
  SELECT ScheduleID, EndTime FROM Activity
  UNION ALL
  SELECT ScheduleID, StartTime FROM Schedule
  UNION ALL
  SELECT ScheduleID, EndTime FROM Schedule
),
