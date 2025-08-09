# 010 - DELETE

Instrukcja `DELETE` służy do usuwania rekordów z tabeli w bazie danych.

## Składnia podstawowa
```sql
DELETE FROM nazwa_tabeli
WHERE warunek;
```
DELETE FROM – wskazuje tabelę, z której usuwasz rekordy.
WHERE – określa, które rekordy mają zostać usunięte.

Uwaga: pominięcie WHERE spowoduje usunięcie wszystkich rekordów w tabeli!

### Przykład usunięcia jednego rekordu
```sql
DELETE FROM users WHERE id = 5;
```
Usunie wiersz o id = 5.

### Usunięcie wszystkich rekordów
```sql
DELETE FROM users;
```
Usuwa wszystkie wiersze w tabeli. Operacja nie może być cofnięta bez kopii zapasowej.

### Usuwanie na podstawie innej tabeli
Można usunąć rekordy z jednej tabeli na podstawie warunków w innej:
```sql
DELETE users
FROM users, prospect_users
WHERE users.username = prospect_users.username
AND NOT prospect_users.active;
```

## Dobre praktyki
- Zawsze używaj WHERE – unikniesz przypadkowego skasowania całej tabeli.

- Najpierw wykonaj SELECT z tym samym WHERE, żeby upewnić się, co usuniesz.

- Twórz kopie zapasowe lub używaj transakcji.

- Na środowisku produkcyjnym sprawdzaj warunki kilkukrotnie.