-- Puzzle #4: Two Predicates (MySQL version)
-- Cel: znaleźć zamówienia do TX od klientów, którzy mieli też zamówienia do CA.


-- Step 1 — Utworzenie tabeli Orders

USE sql_learner;
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders (
    CustomerID INT,
    OrderID INT,
    DeliveryState CHAR(2),
    Amount DECIMAL(10,2)
);

INSERT INTO Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001, 1, 'CA', 340),
(1001, 2, 'TX', 950),
(1001, 3, 'TX', 670),
(1001, 4, 'TX', 860),
(2002, 5, 'WA', 320),
(3003, 6, 'CA', 650),
(3003, 7, 'CA', 830),
(4004, 8, 'TX', 120);


-- Step 2 — Podgląd danych wejściowych

SELECT * FROM Orders ORDER BY CustomerID, OrderID;


-- Step 3 — Zapytanie końcowe

SELECT *
FROM Orders
WHERE DeliveryState = 'TX'
  AND CustomerID IN (
      SELECT DISTINCT CustomerID
      FROM Orders
      WHERE DeliveryState = 'CA'
  )
ORDER BY CustomerID, OrderID;
