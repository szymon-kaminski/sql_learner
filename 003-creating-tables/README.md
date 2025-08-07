# 📄 Tworzenie tabel w SQL (`CREATE TABLE`)

## 1. Baza danych
Zanim stworzysz tabelę, musisz najpierw utworzyć i wybrać bazę danych:

```sql
CREATE DATABASE demo_db;
USE demo_db;
```

## 2. Typy danych
Podczas tworzenia tabeli określasz typ danych dla każdej kolumny:

| Typ danych  | Opis                             |
|-------------|----------------------------------|
| INT         | Liczba całkowita                 |
| VARCHAR(n)  | Tekst (maksymalnie n znaków)     |
| TEXT        | Dłuższy tekst                    |
| DATE        | Data                             |
| BOOL        | Wartość logiczna (TRUE/FALSE)    |

## 3. Tworzenie tabeli

```sql
CREATE TABLE users (
  id INT PRIMARY KEY AUTO_INCREMENT,
  username VARCHAR(255) NOT NULL,
  about TEXT,
  birthday DATE,
  active BOOL
);
```

### Wyjaśnienie:
- `id` – unikalny identyfikator użytkownika (liczba, rośnie automatycznie)
- `username` – wymagane pole tekstowe
- `about` – opcjonalny tekst
- `birthday` – data urodzin
- `active` – czy użytkownik jest aktywny (TRUE/FALSE)

## 4. Indeksy
Indeksy przyspieszają wyszukiwanie danych.

```sql
CREATE INDEX birthday_idx ON users(birthday);
CREATE INDEX users_multi_idx ON users(birthday, active);
```

## 5. Modyfikowanie tabel

Dodanie nowej kolumny:

```sql
ALTER TABLE users ADD email VARCHAR(255);
```

Usunięcie kolumny:

```sql
ALTER TABLE users DROP COLUMN email;
```

Zmiana typu danych:

```sql
ALTER TABLE users MODIFY about LONGTEXT;
```

## 6. Kopiowanie tabeli

```sql
CREATE TABLE users2 AS (SELECT * FROM users);
```

## 7. Zmiana nazwy tabeli

```sql
ALTER TABLE users2 RENAME TO users3;
```

## 8. Usuwanie danych i tabel

Usunięcie całej tabeli (łącznie ze strukturą):

```sql
DROP TABLE users;
```

Usunięcie tylko danych, bez usuwania struktury tabeli:

```sql
TRUNCATE TABLE users;
```
