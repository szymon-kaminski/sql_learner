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