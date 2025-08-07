-- 1. Tworzymy bazę danych i ją wybieramy
CREATE DATABASE IF NOT EXISTS demo_db;
USE demo_db;

-- 2. Tworzymy tabelę users
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  about TEXT,
  birthday DATE,
  active BOOL
);

-- 3. Tworzymy indeksy
CREATE INDEX birthday_idx ON users(birthday);
CREATE INDEX users_multi_idx ON users(birthday, active);

-- 4. Dodajemy kolumnę email
ALTER TABLE users ADD email VARCHAR(255);

-- 5. Usuwamy kolumnę email
ALTER TABLE users DROP COLUMN email;

-- 6. Zmieniamy typ kolumny about
ALTER TABLE users MODIFY about LONGTEXT;

-- 7. Kopiujemy tabelę users do users2
CREATE TABLE users2 AS (SELECT * FROM users);

-- 8. Zmieniamy nazwę tabeli users2 na users3
ALTER TABLE users2 RENAME TO users3;

-- 9. Czyścimy dane z tabeli users (ale nie strukturę)
TRUNCATE TABLE users;

-- 10. Usuwamy tabelę users3 całkowicie
DROP TABLE users3;
