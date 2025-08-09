# 008 - INSERT

W tym rozdziale uczymy się, jak dodawać dane do tabeli w bazie danych za pomocą polecenia `INSERT`.

## Podstawowa składnia INSERT

```sql
INSERT INTO nazwa_tabeli (kolumna1, kolumna2, kolumna3)
VALUES ('wartość1', 'wartość2', 'wartość3');
INSERT INTO wskazuje, do której tabeli chcemy dodać dane.
```

Następnie podajemy kolumny, do których chcemy wstawić wartości.

Za pomocą VALUES podajemy wartości, które mają zostać wstawione.

Ważne, aby wartości były podane w kolejności zgodnej z kolejnością kolumn.

### Wstawianie pojedynczego rekordu
Przykład:
```sql
INSERT INTO users (username, email, active)
VALUES ('greisi', 'g@devdojo.com', true);
```

### Wstawianie wielu rekordów naraz
Zamiast wykonywać wiele osobnych zapytań, można użyć jednego polecenia INSERT z wieloma wartościami:
```sql
INSERT INTO users (username, email, active)
VALUES
  ('user1', 'user1@devdojo.com', true),
  ('user2', 'user2@devdojo.com', true),
  ('user3', 'user3@devdojo.com', true),
  ('user4', 'user4@devdojo.com', true),
  ('user5', 'user5@devdojo.com', true);
  ```

### Wstawianie rekordów na podstawie zapytania SELECT
Czasem chcemy przenieść dane z innej tabeli, np. z tabeli prospect_users do tabeli users. Możemy to zrobić tak:
```sql
INSERT INTO users (username, email, active)
SELECT username, email, active
FROM prospect_users
WHERE active = true;
```
To polecenie doda do users wszystkich aktywnych użytkowników z prospect_users.

### Podsumowanie:

- INSERT służy do dodawania danych do tabeli.

- Można wstawiać pojedyncze lub wiele rekordów naraz.

- Można też dodać dane z innej tabeli za pomocą INSERT INTO ... SELECT.