-- Puzzle #1: Shopping Carts

-- Step 1: create table and insert sample data
CREATE TABLE ShoppingCarts (
    Cart1 VARCHAR(50),
    Cart2 VARCHAR(50)
);

INSERT INFO ShoppingCarts (Cart1, Cart2) VALUES
('SUGAR', 'SUGAR'),
('BREAD', 'BREAD'),
('JUICE', 'BUTTER'),
('SODA', 'CHEESE'),
('FLOUR', 'FRUIT');

-- Step 2: Select Cart1 only
SELECT Cart1 as ItemCart1, NULL AS ItemCart2
FROM ShoppingCarts;

-- Step 3: Secelct Cart2 only
SELECT NULL AS ItemCart1, Cart2 as ItemCart2
FROM ShoppingCarts;
