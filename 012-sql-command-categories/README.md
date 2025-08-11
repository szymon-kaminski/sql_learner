# 012 SQL | DDL, DQL, DML, DCL and TCL Commands

## Podział: 
- SQL dzieli się na kilka „podjęzyków” — każdy odpowiada za inny obszar pracy z bazą danych.

- DDL – Data Definition Language (język definicji danych)
Do tworzenia i modyfikowania struktury bazy danych (tabele, widoki, procedury itp.).

Zmienia strukturę, a nie dane.

Typowe komendy:

CREATE – tworzy obiekt (tabelę, bazę, widok…)

DROP – usuwa obiekt

ALTER – zmienia istniejący obiekt (np. dodaje kolumnę)

TRUNCATE – usuwa wszystkie rekordy z tabeli (bez możliwości ROLLBACK)

RENAME – zmienia nazwę obiektu

COMMENT – dodaje komentarz do obiektu

- DQL – Data Query Language (język zapytań do danych)
Służy do pobierania danych z bazy.

Praktycznie jedyna główna komenda:

SELECT

- DML – Data Manipulation Language (język manipulacji danymi)
Służy do modyfikowania zawartości tabel (rekordów).

Typowe komendy:

INSERT – dodaje rekord

UPDATE – zmienia rekord

DELETE – usuwa rekord

LOCK – blokuje tabelę

CALL – wywołuje procedurę

EXPLAIN – pokazuje plan wykonania zapytania

- DCL – Data Control Language (język kontroli dostępu)
Kontroluje prawa dostępu użytkowników.

Typowe komendy:

GRANT – przydziela uprawnienia

REVOKE – odbiera uprawnienia

- TCL – Transaction Control Language (język kontroli transakcji)
Zarządza transakcjami w bazie (np. przy operacjach DML).

Typowe komendy:

COMMIT – zatwierdza transakcję

ROLLBACK – wycofuje transakcję

SAVEPOINT – ustawia punkt przywracania

SET TRANSACTION – ustawia parametry transakcji

## Tabela porównawcza
| Typ poleceń | Pełna nazwa                     | Cel / zastosowanie                                          | Przykłady poleceń                                          |
|-------------|---------------------------------|-------------------------------------------------------------|------------------------------------------------------------|
| **DDL**     | Data Definition Language        | Tworzenie i modyfikowanie struktury bazy danych             | `CREATE`, `DROP`, `ALTER`, `TRUNCATE`, `RENAME`            |
| **DQL**     | Data Query Language             | Pobieranie danych z bazy                                    | `SELECT`                                                   |
| **DML**     | Data Manipulation Language      | Wstawianie, modyfikowanie i usuwanie danych                 | `INSERT`, `UPDATE`, `DELETE`, `LOCK`, `CALL`               |
| **DCL**     | Data Control Language           | Zarządzanie uprawnieniami do bazy danych                    | `GRANT`, `REVOKE`                                          |
| **TCL**     | Transaction Control Language    | Zarządzanie transakcjami w bazie danych                     | `COMMIT`, `ROLLBACK`, `SAVEPOINT`, `SET TRANSACTION`       |
