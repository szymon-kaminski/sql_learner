-- Puzzle #63: Promotion codes

-- Step 1: Utworzenie bazy i tabeli
DROP DATABASE IF EXISTS puzzle63;
CREATE DATABASE puzzle63;
USE puzzle63;

CREATE TABLE Orders (
    OrderID INT,
    Product VARCHAR(50),
    Discount VARCHAR(50)
);
