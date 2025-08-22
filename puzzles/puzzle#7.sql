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