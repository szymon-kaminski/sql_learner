# 011-JOIN
JOIN pozwala łączyć dane z dwóch (lub więcej) tabel na podstawie warunku logicznego — najczęściej dopasowania wartości w kolumnach.

## Najpopularniejsze typy JOIN w MySQL to:

- INNER JOIN – zwraca tylko te rekordy, które mają dopasowanie w obu tabelach.

- LEFT JOIN – zwraca wszystkie rekordy z lewej tabeli oraz dopasowane z prawej (jeśli brak dopasowania – NULL).

- RIGHT JOIN – odwrotność LEFT JOIN.

- CROSS JOIN – iloczyn kartezjański (wszystkie możliwe kombinacje).

## Struktura przykładowych tabel
```sql
-- Tabela użytkowników

CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(50)
);

INSERT INTO users (id, username) VALUES
(1, 'bobby'),
(2, 'devdojo'),
(3, 'tony');


-- Tabela profili użytkowników

CREATE TABLE profiles (
    id INT PRIMARY KEY,
    user_id INT,
    about VARCHAR(100),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO profiles (id, user_id, about) VALUES
(1, 1, 'Full-stack developer'),
(2, 2, 'Database admin');
```

## Przykład INNER JOIN
Pobieramy użytkowników, którzy mają profil w tabeli profiles:
```sql
SELECT users.id, users.username, profiles.about
FROM users
INNER JOIN profiles ON users.id = profiles.user_id;
```
Wynik:
```sql
+----+----------+----------------------+
| id | username | about                |
+----+----------+----------------------+
|  1 | bobby    | Full-stack developer |
|  2 | devdojo  | Database admin       |
+----+----------+----------------------+
```

## Przykład LEFT JOIN
Pobieramy wszystkich użytkowników i, jeśli istnieje, ich profil:
```sql
SELECT users.id, users.username, profiles.about
FROM users
LEFT JOIN profiles ON users.id = profiles.user_id;
```
Wynik:
```sql
+----+----------+----------------------+
| id | username | about                |
+----+----------+----------------------+
|  1 | bobby    | Full-stack developer |
|  2 | devdojo  | Database admin       |
|  3 | tony     | NULL                 |
+----+----------+----------------------+
```

## Przykład RIGHT JOIN
Odwrotność LEFT JOIN – przydatne, gdy chcemy zobaczyć wszystkie rekordy z prawej tabeli:
```sql
SELECT users.id, users.username, profiles.about
FROM users
RIGHT JOIN profiles ON users.id = profiles.user_id;
```

## Przykład CROSS JOIN
Zwraca wszystkie możliwe kombinacje rekordów z obu tabel:
```sql
SELECT users.username, profiles.about
FROM users
CROSS JOIN profiles;
```

## Uwaga:

- INNER JOIN usuwa rekordy bez dopasowania.

- LEFT/RIGHT JOIN pozwalają zachować rekordy z jednej tabeli, nawet jeśli brak dopasowania w drugiej.

- CROSS JOIN jest rzadziej używany — szybko rośnie liczba wyników.