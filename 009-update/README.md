# 009 - UPDATE

Instrukcja `UPDATE` służy do modyfikowania istniejących danych w tabeli.  
Pozwala zmienić wartości w jednej lub wielu kolumnach, dla jednego lub wielu rekordów.

## Składnia podstawowa
```sql
UPDATE nazwa_tabeli
SET kolumna1 = 'nowa_wartość', kolumna2 = 'inna_wartość'
WHERE warunek;
```

- **UPDATE nazwa_tabeli** – określa tabelę, w której chcesz wprowadzić zmiany.
- **SET** – lista kolumn i wartości, które mają zostać zmienione.
- **WHERE** – filtr określający, które rekordy mają zostać zaktualizowane.

**Uwaga:** jeśli pominiesz `WHERE`, wszystkie rekordy w tabeli zostaną zaktualizowane!

---

## Przykłady

### 1. Aktualizacja pojedynczego rekordu
```sql
UPDATE users
SET username = 'bobbyiliev'
WHERE id = 1;
```

### 2. Aktualizacja wielu rekordów (bez `WHERE`)
```sql
UPDATE users
SET about = '404 bio not found';
```
> Ten zapis zmieni kolumnę \`about\` we wszystkich rekordach.

### 3. Aktualizacja jednego rekordu z warunkiem
```sql
UPDATE users
SET about = 'Hello World :)'
WHERE id = 2;
```

---

## Aktualizacja na podstawie innej tabeli
Można zmienić wartości w jednej tabeli na podstawie danych z innej:
```sql
UPDATE users, prospect_users
SET users.about = prospect_users.about
WHERE prospect_users.username = users.username;
```

---

## Dobre praktyki
1. **Zawsze używaj `WHERE`** (chyba że świadomie chcesz zmienić wszystkie rekordy).
2. **Najpierw przetestuj `SELECT` z tym samym `WHERE`** – upewnisz się, że zmienisz właściwe wiersze.
3. Twórz kopię zapasową lub używaj transakcji, gdy to możliwe.
4. Przy pracy na środowisku produkcyjnym, zawsze dwa razy sprawdź warunki aktualizacji.