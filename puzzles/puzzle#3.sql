-- Puzzle #3: Fiscal Year Pay Rates
-- Cel: Zabezpieczyć tabelę constraintami, aby zawierała tylko poprawne rekordy.
-- Założenie: standardowy rok fiskalny = kalendarzowy (1 stycznia – 31 grudnia).
-- Dialekt: T-SQL (SQL Server) – # oznacza tabelę tymczasową.

------------------------------------------------------------
-- Step 1 — Utworzenie tabeli bazowej (jak w treści zadania)
IF OBJECT_ID('tempdb..#EmployeePayRecord') IS NOT NULL
    DROP TABLE #EmployeePayRecord;
GO

CREATE TABLE #EmployeePayRecord
(
    EmployeeID  INT,
    FiscalYear  INT,
    StartDate   DATE,
    EndDate     DATE,
    PayRate     MONEY
);
GO
