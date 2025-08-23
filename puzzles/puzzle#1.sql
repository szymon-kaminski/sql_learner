-- Puzzle #1: Shopping Carts (MySQL version)
-- Cel: Audyt dwóch koszyków. Najpierw elementy wspólne w jednej linii,
--      potem tylko z Cart 1, a na końcu tylko z Cart 2.

------------------------------------------------------------
-- Step 1 — Utworzenie tabeli z danymi wejściowymi
------------------------------------------------------------
DROP TABLE IF EXISTS ShoppingCarts;

CREATE TABLE ShoppingCarts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cart1_item VARCHAR(50),
    cart2_item VARCHAR(50)
);

INSERT INTO ShoppingCarts (cart1_item, cart2_item) VALUES
('Sugar', 'Sugar'),
('Bread', 'Bread'),
('Juice', 'Butter'),
('Soda',  'Cheese'),
('Flour', 'Fruit');

------------------------------------------------------------
-- Step 2 — Weryfikacja danych
------------------------------------------------------------
SELECT * FROM ShoppingCarts ORDER BY id;

------------------------------------------------------------
-- Step 3 — Rozbicie na dwie listy (Cart 1 i Cart 2)
------------------------------------------------------------
-- Cart 1
SELECT id, cart1_item AS ItemCart1
FROM ShoppingCarts
ORDER BY id;

-- Cart 2
SELECT id, cart2_item AS ItemCart2
FROM ShoppingCarts
ORDER BY id;

------------------------------------------------------------
-- Step 4 — Częściowe wyniki: Intersection / Left-only / Right-only
------------------------------------------------------------
-- Intersection: elementy, które występują w obu koszykach (po nazwie)
WITH c1 AS (
  SELECT id, cart1_item AS item FROM ShoppingCarts
),
c2 AS (
  SELECT id, cart2_item AS item FROM ShoppingCarts
)
SELECT c1.item AS ItemCart1, c2.item AS ItemCart2
FROM c1
JOIN c2 ON c1.item = c2.item
ORDER BY c1.id;

-- Left-only: tylko w Cart 1
WITH c1 AS (
  SELECT id, cart1_item AS item FROM ShoppingCarts
),
c2 AS (
  SELECT id, cart2_item AS item FROM ShoppingCarts
)
SELECT c1.item AS ItemCart1, NULL AS ItemCart2
FROM c1
LEFT JOIN c2 ON c1.item = c2.item
WHERE c2.item IS NULL
ORDER BY c1.id;

-- Right-only: tylko w Cart 2
WITH c1 AS (
  SELECT id, cart1_item AS item FROM ShoppingCarts
),
c2 AS (
  SELECT id, cart2_item AS item FROM ShoppingCarts
)
SELECT NULL AS ItemCart1, c2.item AS ItemCart2
FROM c2
LEFT JOIN c1 ON c2.item = c1.item
WHERE c1.item IS NULL
ORDER BY c2.id;

------------------------------------------------------------
-- Step 5 — Finalne zapytanie (wspólne / tylko Cart1 / tylko Cart2)
------------------------------------------------------------
WITH
c1 AS (SELECT id, cart1_item AS item FROM ShoppingCarts),
c2 AS (SELECT id, cart2_item AS item FROM ShoppingCarts)
SELECT ItemCart1, ItemCart2
FROM (
  -- 1) Wspólne
  SELECT 1 AS section, c1.id AS ord, c1.item AS ItemCart1, c2.item AS ItemCart2
  FROM c1
  JOIN c2 ON c1.item = c2.item

  UNION ALL

  -- 2) Tylko Cart 1
  SELECT 2 AS section, c1.id AS ord, c1.item AS ItemCart1, NULL AS ItemCart2
  FROM c1
  LEFT JOIN c2 ON c1.item = c2.item
  WHERE c2.item IS NULL

  UNION ALL

  -- 3) Tylko Cart 2
  SELECT 3 AS section, c2.id AS ord, NULL AS ItemCart1, c2.item AS ItemCart2
  FROM c2
  LEFT JOIN c1 ON c2.item = c1.item
  WHERE c1.item IS NULL
) AS unioned
ORDER BY section, ord;
