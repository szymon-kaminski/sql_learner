-- Puzzle #4: Two Predicates
-- Cel: Dla każdego klienta, który miał dostawę do Kalifornii (CA),
--      pokaż zamówienia tego klienta, które były dostarczone do Teksasu (TX).


-- Step 1 — Utworzenie tabeli i danych wejściowych
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

-- Step 2 — Sprawdzenie danych wejściowych
SELECT * FROM Orders;