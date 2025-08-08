-- Wybór bazy danych
USE sql_demo;

-- 1. Wybranie aktywnych użytkowników
SELECT DISTINCT username, email, active FROM users WHERE active = TRUE;

-- 2. Wybranie nieaktywnych użytkowników
SELECT username, email, active FROM users WHERE active = FALSE;

-- 3. Wybranie użytkowników o nazwie 'bobby'
SELECT username, email, active FROM users WHERE username = 'bobby';

-- 4. Użycie operatora AND
SELECT * FROM users WHERE username = 'bobby' AND active = TRUE;

-- 5. Użycie operatora OR
SELECT * FROM users WHERE username = 'bobby' OR active = FALSE;

-- 6. Użycie operatora LIKE (wyszukiwanie literki 'y' w username)
SELECT * FROM users WHERE username LIKE '%y%';

-- 7. Użycie operatora IN
SELECT * FROM users WHERE username IN ('bobby', 'devdojo');

-- 8. Sprawdzenie wartości NULL w kolumnie about
SELECT * FROM users WHERE about IS NULL;

-- 9. Sprawdzenie wartości NOT NULL w kolumnie about
SELECT * FROM users WHERE about IS NOT NULL;

-- 10. Użycie operatora BETWEEN dla id od 3 do 6
SELECT * FROM users WHERE id BETWEEN 3 AND 6;