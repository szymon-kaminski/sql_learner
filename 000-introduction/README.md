# 000 - Wprowadzenie do SQL

## Co to jest SQL?

**SQL** (Structured Query Language) to język służący do pracy z relacyjnymi bazami danych. Dzięki niemu możemy:

- tworzyć bazy danych i tabele,
- dodawać dane,
- pobierać dane (SELECT),
- aktualizować dane (UPDATE),
- usuwać dane (DELETE),
- łączyć tabele (JOIN),
- filtrować i grupować dane,
- tworzyć zaawansowane zapytania (np. zagnieżdżone, UNION, itp).

SQL działa praktycznie tak samo niezależnie od bazy danych: MySQL, PostgreSQL, SQLite, SQL Server itd. Różnice są minimalne (głównie składnia lub dodatkowe funkcje).

---

## Czym jest relacyjna baza danych?

Relacyjna baza danych to taka, która przechowuje dane w **tabelach**. Każda tabela to zbiór **wierszy** (rekordów) i **kolumn** (atrybutów). Tabele mogą być ze sobą **powiązane** (np. kluczami obcymi - foreign keys).

Przykład tabeli `users`:

| id | name     | age |
|----|----------|-----|
| 1  | Szymon   | 28  |
| 2  | Kasia    | 31  |

---

## Jak pracujemy z SQL?

Możesz korzystać z:
- **terminala/konsoli MySQL**: uruchamiasz polecenia SQL ręcznie,
- **graficznego narzędzia** (np. DBeaver, phpMyAdmin, HeidiSQL),
- **SQLite** — lekka baza bez instalacji (dla nauki IDEALNA).

---

##  Polecane środowisko (dla początkujących)

### SQLite
Najprostszy sposób, by zacząć. Możesz uruchamiać `.sql` przez terminal lub VS Code wpisując w terminalu `sqlite3`.
By opuścić sqlite należy wpisać w terminalu `.exit`.

### Sprawdzenie wersji:
SELECT sqlite_version();

---

## Praktyka – jak uruchomić zapytania z pliku `hdfhd_khgfs.sql`

**Przejdź do folderu z plikiem**
   ```bash
   cd "C:\Users\11\OneDrive\Desktop\PYTHON PLIKI\git-projekty\sql_learner\004-basic-syntax"
   ```
Uruchom MySQL i zaloguj się

```bash
mysql -u root -p
```
Wpisz swoje hasło do MySQL.

Wybierz bazę danych

```sql
USE test_db;
```
(lub inną, której chcesz używać)

Uruchom plik z zapytaniami

```sql
SOURCE basic_syntax.sql;
```
MySQL wykona wszystkie komendy w pliku po kolei, a wyniki SELECT zostaną wyświetlone w terminalu.

Opcjonalnie – ładniejsze wyświetlanie wyników
W trybie MySQL wpisz:
```sql
\G
```
aby rekordy były prezentowane w formie listy, lub uruchom MySQL z opcjami:

```sql
mysql -u root -p --table --pager=less
```