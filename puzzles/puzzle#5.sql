-- Puzzle #5: Phone Directory
-- Cel: Przekształcić tabelę z typami telefonów (Cellular, Work, Home)
--      w jedną tabelę, gdzie każdy typ telefonu jest osobną kolumną.


-- Step 1 — Utworzenie tabeli i danych wejściowych
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

-- Step 2 — Sprawdzenie danych wejściowych
SELECT * FROM PhoneDirectory;

-- Step 3 — Przekształcenie typu na kolumny (CASE)
SELECT 
    CustomerID,
    CASE WHEN Type = 'Cellular' THEN PhoneNumber END AS Cellular,
    CASE WHEN Type = 'Work'     THEN PhoneNumber END AS Work,
    CASE WHEN Type = 'Home'     THEN PhoneNumber END AS Home
FROM PhoneDirectory;

-- Wynik: kilka wierszy dla tego samego klienta, z NULL-ami
-- (bo tylko jedna kolumna ma wartość w danym wierszu)

-- Step 4 — Grupowanie po CustomerID z agregacją MAX
SELECT 
    CustomerID,
    MAX(CASE WHEN Type = 'Cellular' THEN PhoneNumber END) AS Cellular,
    MAX(CASE WHEN Type = 'Work'     THEN PhoneNumber END) AS Work,
    MAX(CASE WHEN Type = 'Home'     THEN PhoneNumber END) AS Home
FROM PhoneDirectory
GROUP BY CustomerID;

-- Step 5 — Finalne zapytanie (posortowane dla czytelności)
SELECT 
    CustomerID,
    MAX(CASE WHEN Type = 'Cellular' THEN PhoneNumber END) AS Cellular,
    MAX(CASE WHEN Type = 'Work'     THEN PhoneNumber END) AS Work,
    MAX(CASE WHEN Type = 'Home'     THEN PhoneNumber END) AS Home
FROM PhoneDirectory
GROUP BY CustomerID
ORDER BY CustomerID;