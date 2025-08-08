-- Wybieramy bazę danych na początku
CREATE DATABASE IF NOT EXISTS sql_demo;
USE sql_demo;

-- Tworzenie tabeli (zakładam, że baza już istnieje)
CREATE TABLE IF NOT EXISTS users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    about TEXT,
    email VARCHAR(255),
    birthday DATE,
    active BOOL
);

-- Wstawiamy dane (opcjonalnie, można usunąć, jeśli już wstawione)
INSERT INTO users (username, email, active) VALUES
  ('bobby', 'b@devdojo.com', true),
  ('devdojo', 'd@devdojo.com', false),
  ('tony', 't@devdojo.com', true);
  
-- 1. Podstawowe SELECT
SELECT * FROM users;
SELECT username, active FROM users;

-- 2. LIKE i wzorce
SELECT * FROM users WHERE username LIKE '%y';  
SELECT * FROM users WHERE username LIKE '_e%'; 

-- 3. Formatowanie wyników (w CLI MySQL)
-- SELECT * FROM users \G

-- 4. SELECT bez FROM
SELECT 'Sunil' AS username;

-- 5. Operacje arytmetyczne
SELECT username, active*5 AS new_active FROM users;

-- 6. LIMIT
SELECT * FROM users LIMIT 1;

-- 7. Funkcje agregujące
SELECT COUNT(*) FROM users;
SELECT MIN(id) FROM users;
SELECT MAX(id) FROM users;
SELECT AVG(id) FROM users;
SELECT SUM(id) FROM users;

-- 8. DISTINCT i duplikaty
INSERT INTO users (username, email, active) VALUES
  ('bobby', 'b@devdojo.com', true),
  ('devdojo', 'd@devdojo.com', false),
  ('tony', 't@devdojo.com', true);

SELECT username FROM users;
SELECT DISTINCT username FROM users;