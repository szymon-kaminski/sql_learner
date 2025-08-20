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

-- Step 2 — NOT NULL + podstawowe ograniczenia domeny

-- Ustawiamy NOT NULL (tabela jest pusta, więc ALTER przejdzie bez problemu)
ALTER TABLE #EmployeePayRecord ALTER COLUMN EmployeeID INT  NOT NULL;
ALTER TABLE #EmployeePayRecord ALTER COLUMN FiscalYear INT  NOT NULL;
ALTER TABLE #EmployeePayRecord ALTER COLUMN StartDate  DATE NOT NULL;
ALTER TABLE #EmployeePayRecord ALTER COLUMN EndDate    DATE NOT NULL;
ALTER TABLE #EmployeePayRecord ALTER COLUMN PayRate    MONEY NOT NULL;

-- Dodatkowe CHECK-i domenowe
ALTER TABLE #EmployeePayRecord
ADD CONSTRAINT CK_EPR_EmployeeID_Positive CHECK (EmployeeID > 0);

ALTER TABLE #EmployeePayRecord
ADD CONSTRAINT CK_EPR_FiscalYear_Range CHECK (FiscalYear BETWEEN 1900 AND 9999);

ALTER TABLE #EmployeePayRecord
ADD CONSTRAINT CK_EPR_PayRate_Positive CHECK (PayRate > 0);

ALTER TABLE #EmployeePayRecord
ADD CONSTRAINT CK_EPR_Start_Le_End CHECK (StartDate <= EndDate);

-- Wymusza max 2 miejsca po przecinku:
ALTER TABLE #EmployeePayRecord
ADD CONSTRAINT CK_EPR_PayRate_2decimals CHECK (ROUND(PayRate, 2) = PayRate);