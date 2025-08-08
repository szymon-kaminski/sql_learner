CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

-- Przykładowa tabela użytkowników
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50)
);

-- Dodanie przykładowych danych
INSERT INTO users (id, username) VALUES
(2, 'bobby'),
(3, 'devdojo'),
(4, 'tony'),
(5, 'bobby'),
(6, 'devdojo'),
(7, 'tony');

-- Przykład bez sortowania - domyślnie po id
SELECT id, username FROM users;

-- Sortowanie rosnąco po username
SELECT id, username FROM users ORDER BY username ASC;

-- Sortowanie malejąco po username
SELECT id, username FROM users ORDER BY username DESC;

-- Grupowanie i liczenie użytkowników o tych samych nazwach
SELECT username, COUNT(username) AS user_count FROM users GROUP BY username;

-- Grupowanie i filtrowanie użytkowników, którzy mają więcej niż 1 rekord
SELECT username, COUNT(username) AS user_count
FROM users
GROUP BY username
HAVING COUNT(username) > 1;