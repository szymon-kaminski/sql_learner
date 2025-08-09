-- Tworzymy bazę i przełączamy się na nią
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

-- Usuwamy stare tabele, aby uniknąć konfliktów struktury
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS prospect_users;

-- Tworzymy tabelę users
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    about VARCHAR(255)
);

-- Dodajemy dane przykładowe
INSERT INTO users (id, username, about) VALUES
(2, 'bobby', NULL),
(3, 'devdojo', NULL),
(4, 'tony', NULL),
(5, 'bobby', NULL),
(6, 'devdojo', NULL),
(7, 'tony', NULL);

-- Sprawdzamy początkowe dane
SELECT * FROM users;

-- 1. Aktualizacja wszystkich rekordów
UPDATE users
SET about = '404 bio not found';

SELECT * FROM users;

-- 2. Aktualizacja tylko jednego rekordu
UPDATE users
SET about = 'Hello World :)'
WHERE id = 2;

SELECT * FROM users;

-- Tworzymy tabelę prospect_users do demonstracji aktualizacji z innej tabeli
CREATE TABLE prospect_users (
    id INT PRIMARY KEY,
    username VARCHAR(50),
    about VARCHAR(255)
);

INSERT INTO prospect_users (id, username, about) VALUES
(1, 'bobby', 'Bio from prospects'),
(2, 'devdojo', 'Prospect description'),
(3, 'tony', 'Tony from prospects');

-- 3. Aktualizacja na podstawie innej tabeli
UPDATE users, prospect_users
SET users.about = prospect_users.about
WHERE prospect_users.username = users.username;

SELECT * FROM users;