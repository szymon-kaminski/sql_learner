CREATE DATABASE IF NOT EXISTS sql_learner;
USE sql_learner;

-- Tworzymy przykładową tabelę users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    active BOOLEAN
);

-- Wstawianie pojedynczego rekordu
INSERT INTO users (username, email, active)
VALUES ('greisi', 'g@devdojo.com', true);

-- Wstawianie wielu rekordów naraz
INSERT INTO users (username, email, active)
VALUES
  ('user1', 'user1@devdojo.com', true),
  ('user2', 'user2@devdojo.com', true),
  ('user3', 'user3@devdojo.com', true),
  ('user4', 'user4@devdojo.com', true),
  ('user5', 'user5@devdojo.com', true);

-- Tworzymy tabelę prospect_users z przykładowymi danymi
CREATE TABLE IF NOT EXISTS prospect_users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    email VARCHAR(100),
    active BOOLEAN
);

INSERT INTO prospect_users (username, email, active)
VALUES
  ('prospect1', 'p1@devdojo.com', true),
  ('prospect2', 'p2@devdojo.com', false),
  ('prospect3', 'p3@devdojo.com', true);

-- Wstawianie aktywnych użytkowników z prospect_users do users
INSERT INTO users (username, email, active)
SELECT username, email, active
FROM prospect_users
WHERE active = true;