-- Tworzymy bazę i przełączamy się na nią
CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

-- Czyścimy tabele jeśli istnieją
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

-- Tworzenie tabeli użytkowników
CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50) NOT NULL
);

-- Tworzenie tabeli postów
CREATE TABLE posts (
    id INT PRIMARY KEY,
    user_id INT,
    title VARCHAR(100) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Wstawianie przykładowych użytkowników
INSERT INTO users (id, username) VALUES
(1, 'janek'),
(2, 'ola'),
(3, 'michal');

-- Wstawianie przykładowych postów
INSERT INTO posts (id, user_id, title) VALUES
(1, 1, 'Mój pierwszy post'),
(2, 1, 'Kolejny wpis'),
(3, 2, 'Post Oli');

-- Zapytanie z INNER JOIN - pobiera użytkowników i ich posty
SELECT users.username, posts.title
FROM users
INNER JOIN posts ON users.id = posts.user_id;