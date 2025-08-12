-- Tworzymy bazę i przełączamy się na nią
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

-- Usuwamy tabele jeśli istnieją
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- Tworzymy tabelę customers
CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    address VARCHAR(50),
    salary DECIMAL(10, 2)
);

-- Wstawiamy dane do customers
INSERT INTO customers VALUES
(1, 'Ramesh', 32, 'Ahmedabad', 2000.00),
(2, 'Khilan', 25, 'Delhi', 1500.00),
(3, 'Kaushik', 23, 'Kota', 2000.00),
(4, 'Chaitali', 25, 'Mumbai', 6500.00),
(5, 'Hardik', 27, 'Bhopal', 8500.00),
(6, 'Komal', 22, 'MP', 4500.00),
(7, 'Muffy', 24, 'Indore', 10000.00);

-- Tworzymy tabelę orders
CREATE TABLE orders (
    oid INT PRIMARY KEY,
    date DATETIME,
    customer_id INT,
    amount DECIMAL(10, 2)
);

-- Wstawiamy dane do orders
INSERT INTO orders VALUES
(102, '2009-10-08 00:00:00', 3, 3000),
(100, '2009-10-08 00:00:00', 3, 1500),
(101, '2009-11-20 00:00:00', 2, 1560),
(103, '2008-05-20 00:00:00', 4, 2060);

-- Przykład UNION
SELECT id, name, amount, date
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
UNION
SELECT id, name, amount, date
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;

-- Przykład UNION ALL
SELECT id, name, amount, date
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
UNION ALL
SELECT id, name, amount, date
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;