-- Puzzle #27: Delete the Duplicates

-- Step 1: Create table and insert data
USE sql_learner;

DROP TABLE IF EXISTS SampleData;
CREATE TABLE SampleData (
    id INT AUTO_INCREMENT PRIMARY KEY,
    IntegerValue INT
);

INSERT INTO SampleData (IntegerValue) VALUES
(1),(1),(2),(3),(3),(4);


-- Step 2: Show initial data
SELECT * FROM SampleData;


-- Step 3: Usuń duplikaty, zostawiając jedno wystąpienie każdej liczby
DELETE s1
FROM SampleData s1
JOIN SampleData s2
  ON s1.IntegerValue = s2.IntegerValue
 AND s1.id > s2.id;


-- Step 4: Show final result without duplicates
SELECT * 
FROM SampleData
ORDER BY IntegerValue;