-- Puzzle #64: Between quotes

-- Step 1 – Utworzenie bazy i tabeli
DROP DATABASE IF EXISTS puzzle64;
CREATE DATABASE puzzle64;
USE puzzle64;

CREATE TABLE Strings (
    ID INT,
    Str VARCHAR(50)
);


-- Step 2 – Wstawienie danych testowych
INSERT INTO Strings (ID, Str) VALUES
(1, '"12345678901234"'),
(2, '1"2345678901234"'),
(3, '123"45678"901234"'),
(4, '123"45678901234"'),
(5, '12345678901"234"'),
(6, '12345678901234');

-- Preview data
SELECT * FROM Strings;


-- Step 3: Obliczenia i warunki SQL
SELECT 
    ID,
    Str,
    CASE
        WHEN LENGTH(Str) - LENGTH(REPLACE(Str, '"', '')) <> 2 THEN 'Error'
        ELSE CASE
            WHEN (LOCATE('"', Str, LOCATE('"', Str) + 1) - LOCATE('"', Str) - 1) > 10 THEN 'True'
            WHEN (LOCATE('"', Str, LOCATE('"', Str) + 1) - LOCATE('"', Str) - 1) <= 10 THEN 'False'
            ELSE 'Error'
        END
    END AS Result
FROM Strings;
