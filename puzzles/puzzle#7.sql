-- Puzzle #7: Mission to Mars
-- Cel: Wybrać kandydatów, którzy posiadają wszystkie wymagane umiejętności.


-- Step 1 — Utworzenie tabel i danych wejściowych
CREATE TABLE Candidates (
    CandidateID INT,
    Description VARCHAR(50)
);

CREATE TABLE Requirements (
    Description VARCHAR(50)
);

INSERT INTO Candidates (CandidateID, Description) VALUES
(1001, 'Geologist'),
(1001, 'Astrogator'),
(1001, 'Biochemist'),
(1001, 'Technician'),
(2002, 'Surgeon'),
(2002, 'Machinist'),
(2002, 'Geologist'),
(3003, 'Geologist'),
(3003, 'Astrogator'),
(4004, 'Selenologist');

INSERT INTO Requirements (Description) VALUES
('Geologist'),
('Astrogator'),
('Technician');

-- Step 2 — Sprawdzenie danych wejściowych
SELECT * FROM Candidates;
SELECT * FROM Requirements;

-- Step 3 — Połączenie kandydatów z wymaganiami
SELECT c.CandidateID, c.Description
FROM Candidates c
INNER JOIN Requirements r
    ON c.Description = r.Description;

-- Step 4 — Policzenie ilu wymagań spełnia każdy kandydat
SELECT c.CandidateID, COUNT(*) AS MatchedRequirements
FROM Candidates c
INNER JOIN Requirements r
    ON c.Description = r.Description
GROUP BY c.CandidateID;

-- Step 5 — Porównanie z całkowitą liczbą wymagań
SELECT c.CandidateID
FROM Candidates c
INNER JOIN Requirements r
    ON c.Description = r.Description
GROUP BY c.CandidateID
HAVING COUNT(*) = (SELECT COUNT(*) FROM Requirements);

-- Step 6 — Finalne zapytanie (czytelny wynik, unikalne ID)
SELECT DISTINCT c.CandidateID
FROM Candidates c
INNER JOIN Requirements r
    ON c.Description = r.Description
GROUP BY c.CandidateID
HAVING COUNT(*) = (SELECT COUNT(*) FROM Requirements);