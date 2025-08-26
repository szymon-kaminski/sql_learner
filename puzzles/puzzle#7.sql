-- Puzzle #7: Mission to Mars (MySQL version)
-- Cel: znaleźć kandydatów, którzy spełniają WSZYSTKIE wymagania.


-- Step 1 — Utworzenie tabel

USE sql_learner;
DROP TABLE IF EXISTS Candidates;
DROP TABLE IF EXISTS Requirements;

CREATE TABLE Candidates (
    CandidateID INT,
    Description VARCHAR(50)
);

CREATE TABLE Requirements (
    Description VARCHAR(50)
);


-- Step 2 — Wstawienie danych

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


-- Step 3 — Podgląd danych wejściowych

SELECT * FROM Candidates ORDER BY CandidateID, Description;
SELECT * FROM Requirements ORDER BY Description;


-- Step 4 — Połączenie kandydatów z wymaganiami

SELECT c.CandidateID, c.Description
FROM Candidates c
INNER JOIN Requirements r
    ON c.Description = r.Description
ORDER BY c.CandidateID, c.Description;


-- Step 5 — Zliczenie spełnionych wymagań na kandydata

SELECT c.CandidateID, COUNT(DISTINCT c.Description) AS MatchedRequirements
FROM Candidates c
INNER JOIN Requirements r
    ON c.Description = r.Description
GROUP BY c.CandidateID;


-- Step 6 — Wybranie kandydatów spełniających WSZYSTKIE wymagania

SELECT c.CandidateID
FROM Candidates c
INNER JOIN Requirements r
    ON c.Description = r.Description
GROUP BY c.CandidateID
HAVING COUNT(DISTINCT c.Description) = (SELECT COUNT(*) FROM Requirements);
