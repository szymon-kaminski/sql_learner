-- Puzzle #64: Between quotes

-- Step 1 – Utworzenie bazy i tabeli
DROP DATABASE IF EXISTS puzzle64;
CREATE DATABASE puzzle64;
USE puzzle64;

CREATE TABLE Strings (
    ID INT,
    Str VARCHAR(50)
);
