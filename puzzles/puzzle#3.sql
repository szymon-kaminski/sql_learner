-- Puzzle #3: Fiscal Year Pay Rates (MySQL version)
-- Cel: stworzyć tabelę EmployeePayRecord z odpowiednimi constraintami,
-- aby zapewnić poprawność danych.


-- Step 1 — Utworzenie tabeli z constraintami

USE sql_learner;
DROP TABLE IF EXISTS EmployeePayRecord;

CREATE TABLE EmployeePayRecord (
    EmployeeID INT NOT NULL,
    FiscalYear INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    PayRate DECIMAL(10,2) NOT NULL,

    -- Unikalność pracownik + rok
    CONSTRAINT uq_employee_year UNIQUE (EmployeeID, FiscalYear),

    -- Poprawność dat
    CONSTRAINT chk_dates CHECK (StartDate <= EndDate),

    -- Poprawność płacy
    CONSTRAINT chk_payrate CHECK (PayRate > 0)
);


-- Step 2 — Testy poprawności


-- 2.1 Poprawna próba (powinna działać)
INSERT INTO EmployeePayRecord (EmployeeID, FiscalYear, StartDate, EndDate, PayRate)
VALUES (1, 2025, '2025-01-01', '2025-12-31', 5000.00);

-- 2.2 Duplikat (ten sam pracownik i rok) — powinno się wyłożyć
-- ERROR: Duplicate entry
INSERT INTO EmployeePayRecord (EmployeeID, FiscalYear, StartDate, EndDate, PayRate)
VALUES (1, 2025, '2025-01-01', '2025-12-31', 5200.00);

-- 2.3 Zła kolejność dat (powinno się wyłożyć)
INSERT INTO EmployeePayRecord (EmployeeID, FiscalYear, StartDate, EndDate, PayRate)
VALUES (2, 2025, '2025-12-31', '2025-01-01', 4500.00);

-- 2.4 Ujemna płaca (powinno się wyłożyć)
INSERT INTO EmployeePayRecord (EmployeeID, FiscalYear, StartDate, EndDate, PayRate)
VALUES (3, 2025, '2025-01-01', '2025-12-31', -1000.00);


-- Step 3 — Podgląd danych końcowych

SELECT * FROM EmployeePayRecord;
