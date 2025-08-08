1. Tworzenie bazy i tabeli
```sql
CREATE DATABASE sql_demo;
USE sql_demo;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    about TEXT,
    email VARCHAR(255),
    birthday DATE,
    active BOOL
);

INSERT INTO users (username, email, active) VALUES
  ('bobby', 'b@devdojo.com', true),
  ('devdojo', 'd@devdojo.com', false),
  ('tony', 't@devdojo.com', true);
  ```

2. Podstawowe SELECT
Pobranie wszystkich kolumn i rekordów:
```sql
SELECT * FROM users;
```
Pobranie wybranych kolumn:
```sql
SELECT username, active FROM users;
```

3. Wzorce i LIKE
% — dowolna liczba znaków

_ — dokładnie jeden znak

Przykłady:
```sql
SELECT * FROM users WHERE username LIKE '%y';  -- kończące się na y
SELECT * FROM users WHERE username LIKE '_e%'; -- drugi znak to 'e'
```
LIKE jest case sensitive, ILIKE ignoruje wielkość liter (w MySQL ILIKE nie działa, ale np. w PostgreSQL tak).

4. Formatowanie wyników
Zamiast ; można użyć \G dla pionowego formatu wyjścia:
```sql
SELECT * FROM users \G
```

5. SELECT bez FROM (np. literal)
```sql
SELECT 'Sunil' AS username;
```

6. Operacje arytmetyczne w SELECT
```sql
SELECT username, active*5 AS new_active FROM users;
```

7. LIMIT — ograniczanie liczby zwracanych rekordów
```sql
SELECT * FROM users LIMIT 1;
```

8. Funkcje agregujące
COUNT(*) — liczba rekordów

MIN(column) — najmniejsza wartość

MAX(column) — największa wartość

AVG(column) — średnia wartość

SUM(column) — suma wartości

Przykłady:
```sql
SELECT COUNT(*) FROM users;
SELECT MIN(id) FROM users;
SELECT MAX(id) FROM users;
SELECT AVG(id) FROM users;
SELECT SUM(id) FROM users;
```

9. DISTINCT — unikalne wartości
Dodajemy zduplikowane rekordy:
```sql
INSERT INTO users (username, email, active) VALUES
  ('bobby', 'b@devdojo.com', true),
  ('devdojo', 'd@devdojo.com', false),
  ('tony', 't@devdojo.com', true);
  ```

Zapytanie pokazujące duplikaty:
```sql
SELECT username FROM users;
```

Unikalne wartości:
```sql
SELECT DISTINCT username FROM users;
```