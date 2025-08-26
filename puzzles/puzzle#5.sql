-- Puzzle #5: Phone Directory (MySQL version)
-- Cel: z tabeli z numerami telefonów zrobić pivot:
-- CustomerID | Cellular | Work | Home


-- Step 1 — Utworzenie tabeli PhoneDirectory

USE sql_learner;
DROP TABLE IF EXISTS PhoneDirectory;

CREATE TABLE PhoneDirectory (
    CustomerID INT,
    Type VARCHAR(20),
    PhoneNumber VARCHAR(20)
);

INSERT INTO PhoneDirectory (CustomerID, Type, PhoneNumber) VALUES
(1001, 'Cellular', '555-897-5421'),
(1001, 'Work',     '555-897-6542'),
(1001, 'Home',     '555-698-9874'),
(2002, 'Cellular', '555-963-6544'),
(2002, 'Work',     '555-812-9856'),
(3003, 'Cellular', '555-987-6541');


-- Step 2 — Podgląd danych wejściowych

SELECT * FROM PhoneDirectory ORDER BY CustomerID, Type;


-- Step 3 — Pivot za pomocą CASE

SELECT
    CustomerID,
    MAX(CASE WHEN Type = 'Cellular' THEN PhoneNumber END) AS Cellular,
    MAX(CASE WHEN Type = 'Work'     THEN PhoneNumber END) AS Work,
    MAX(CASE WHEN Type = 'Home'     THEN PhoneNumber END) AS Home
FROM PhoneDirectory
GROUP BY CustomerID
ORDER BY CustomerID;
