-- Sprawdzenie wersji MySQL i aktualnego czasu
SELECT VERSION();
SELECT NOW();

-- Dodanie przykładowego użytkownika
INSERT INTO users (username, email, active)
VALUES ('bobby', 'bobby@bobbyiliev.com', true);

-- Pobranie wszystkich danych
SELECT * FROM users;

-- Pobranie tylko username i email
SELECT username, email FROM users;

-- Zmiana nazwy użytkownika o id=1
UPDATE users
SET username='bobbyiliev'
WHERE id=1;

-- Usunięcie użytkownika o id=1
DELETE FROM users WHERE id=1;