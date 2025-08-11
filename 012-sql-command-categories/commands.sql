-- Ustawiamy kodowanie
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- 1. DDL – Tworzymy bazę i tabelę
CREATE DATABASE IF NOT EXISTS ddl_demo;
USE ddl_demo;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- 2. DML – Wstawiamy dane
INSERT INTO users (name) VALUES ('Janek'), ('Ola');

-- 3. DQL – Pobieramy dane
SELECT * FROM users;

-- 4. DML – Aktualizujemy dane
UPDATE users SET name = 'Jan Kowalski' WHERE id = 1;

-- 5. DCL – (przykład wymaga użytkowników w MySQL)
-- GRANT SELECT ON ddl_demo.* TO 'test_user'@'localhost';
-- REVOKE SELECT ON ddl_demo.* FROM 'test_user'@'localhost';

-- 6. TCL – Transakcja
START TRANSACTION;
INSERT INTO users (name) VALUES ('Transakcja1');
ROLLBACK; -- Anulujemy wstawienie

START TRANSACTION;
INSERT INTO users (name) VALUES ('Transakcja2');
COMMIT; -- Zatwierdzamy wstawienie

-- Sprawdzamy końcowy stan tabeli
SELECT * FROM users;