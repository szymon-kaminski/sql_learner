# 004 - Basic Syntax

W tym rozdziale omówimy podstawową składnię SQL oraz cztery najczęściej używane polecenia:  
`SELECT`, `INSERT`, `UPDATE`, `DELETE` + komentarze.

---

## 1. Czym są polecenia SQL?

Polecenia SQL to komendy, które wykonujesz na bazie danych.  
Dzięki nim określasz, co baza ma zrobić — pobrać, dodać, zmienić lub usunąć dane.

**Przykład:**
```sql
SELECT username FROM users;
```
SELECT – słowo kluczowe, pobiera dane.

username – kolumna, którą chcemy pobrać.

FROM users – tabela źródłowa.

; – średnik na końcu, dobry nawyk.

2. INSERT – dodawanie danych
Dodaje nowe rekordy do tabeli.
```sql
INSERT INTO users (username, email, active)
VALUES ('bobby', 'bobby@bobbyiliev.com', true);
```
INSERT INTO – wstaw dane.

Lista kolumn – mówi, które pola wypełniamy.

VALUES – wartości w tej samej kolejności.

3. SELECT – pobieranie danych
Wszystkie kolumny:
```sql
SELECT * FROM users;
```
* oznacza wszystkie kolumny.

Wybrane kolumny:
```sql
SELECT username, email FROM users;
```
4. UPDATE – modyfikowanie danych
```sql
UPDATE users
SET username='bobbyiliev'
WHERE id=1;
```
UPDATE – zmiana danych w tabeli.

SET – nowe wartości.

WHERE – określa, które wiersze zmienić.

⚠ Brak WHERE spowoduje zmianę wszystkich rekordów.

5. DELETE – usuwanie danych
```sql
DELETE FROM users WHERE id=1;
```
DELETE – usuń dane.

WHERE – wskazuje, co usunąć.

⚠ Brak WHERE usunie wszystkie rekordy.

6. Komentarze w SQL
Jednolinijkowe:

```sql
SELECT * FROM users; -- Pobierz wszystkich użytkowników
```
Wielolinijkowe:

```sql
/*
Komentarz
na wiele linii
*/
SELECT * FROM users;
```