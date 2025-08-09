-- Tworzymy bazę i przełączamy się na nią
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

-- Usuwamy stare tabele
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
(1, 'alice', 'Developer'),
(2, 'bobby', 'Designer'),
(3, 'tony', 'Manager'),
(4, 'bob', 'Intern'),
(5, 'john', 'Tester');

SELECT * FROM users;

-- Usunięcie jednego rekordu
DELETE FROM users WHERE id = 5;
SELECT * FROM users;

-- Usunięcie wszystkich rekordów
DELETE FROM users;
SELECT * FROM users;

-- Dodajemy dane ponownie do demonstracji DELETE z innej tabeli
INSERT INTO users (id, username, about) VALUES
(1, 'alice', 'Developer'),
(2, 'bobby', 'Designer'),
(3, 'tony', 'Manager');

CREATE TABLE prospect_users (
id INT PRIMARY KEY,
username VARCHAR(50),
active BOOLEAN
);

INSERT INTO prospect_users (id, username, active) VALUES
(1, 'alice', TRUE),
(2, 'bobby', FALSE),
(3, 'tony', TRUE);

-- Usunięcie użytkowników, którzy mają odpowiednik w prospect_users z active=FALSE
DELETE users
FROM users, prospect_users
WHERE users.username = prospect_users.username
AND NOT prospect_users.active;

SELECT * FROM users;