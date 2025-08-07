# 001 - Bazy danych (Databases)

## Co to jest baza danych?

Baza danych to zorganizowany zbiór informacji (danych), który można łatwo przeszukiwać, aktualizować i zarządzać nim. Najczęściej dane są przechowywane w **tabelach** przypominających arkusze kalkulacyjne (wiersze i kolumny).

## System zarządzania bazą danych (DBMS)

To oprogramowanie, które umożliwia tworzenie, modyfikowanie i zarządzanie bazami danych. Przykłady:
- MySQL
- PostgreSQL
- SQLite
- Oracle
- MS SQL Server

## Relacyjne bazy danych

Dane są przechowywane w **tabelach** powiązanych ze sobą za pomocą **kluczy** (np. `id`, `user_id` itd.). Przykład relacji:
- `users` (użytkownicy)
- `orders` (zamówienia powiązane z użytkownikami)

## Czym różni się SQL od DBMS?

- SQL to **język** (Structured Query Language), który pozwala na komunikację z bazą danych.
- DBMS to **narzędzie**, które SQL obsługuje.

## SQLite

SQLite to lekki system bazodanowy, który działa bez serwera i zapisuje dane w jednym pliku. Świetnie nadaje się do nauki i małych projektów.

## Instrukcja użycia
Krok po kroku w terminalu:
1.	Wejdź do folderu projektu:
cd "C:\Users\...\sql_learner"
2.	Uruchom SQLite:
sqlite3
3.	Utwórz plik bazy danych (opcjonalnie, jeśli chcesz mieć trwałą bazę):
.open mydatabase.db
4.	Wczytaj plik SQL:
.read 001-databases/create_tables.sql
5.	Sprawdź dane:
SELECT * FROM users;
SELECT * FROM orders;

