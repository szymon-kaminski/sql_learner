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


Step 2: Wstawienie danych testowych
INSERT INTO Orders (OrderID, Product, Discount) VALUES
(1, 'Item 1', 'PROMO'),
(1, 'Item 1', 'PROMO'),
(1, 'Item 1', 'MARKDOWN'),
(1, 'Item 2', 'PROMO'),
(2, 'Item 2', NULL),
(2, 'Item 3', 'MARKDOWN'),
(2, 'Item 3', NULL),
(3, 'Item 1', 'PROMO'),
(3, 'Item 1', 'PROMO'),
(3, 'Item 1', 'PROMO');

-- Preview data
SELECT * FROM Orders;