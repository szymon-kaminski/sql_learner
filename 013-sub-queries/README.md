# 013 - SQL Subqueries
Co to jest subquery?
Subquery (podzapytanie) to zapytanie SQL zagnieżdżone w innym zapytaniu SQL.

## Może występować w:

- klauzuli SELECT

- klauzuli FROM

- klauzuli WHERE

Subquery wykonuje się jako pierwsze, a jego wynik przekazywany jest do zapytania nadrzędnego.

## Gdzie można stosować subquery?
- W zapytaniu SELECT

- W zapytaniu INSERT

- W zapytaniu UPDATE

- W zapytaniu DELETE

- W innym subquery (zagnieżdżone podzapytania)

## Do czego służą subqueries?
- Porównywania wartości do wyniku zapytania

- Sprawdzania, czy dana wartość należy do wyniku zapytania

- Weryfikacji, czy zapytanie zwraca jakiekolwiek wiersze

### Przykłady
1. Subquery w SELECT
```sql
SELECT *
FROM CUSTOMERS
WHERE ID IN (
    SELECT ID
    FROM CUSTOMERS
    WHERE SALARY > 4500
);
```
Wynik:

+----+----------+------+---------+----------+
| ID | NAME     | AGE  | ADDRESS | SALARY   |
+----+----------+------+---------+----------+
|  4 | Chaitali |   25 | Mumbai  |  6500.00 |
|  5 | Hardik   |   27 | Bhopal  |  8500.00 |
|  7 | Muffy    |   24 | Indore  | 10000.00 |
+----+----------+------+---------+----------+

2. Subquery w UPDATE
```sql
UPDATE CUSTOMERS
SET SALARY = SALARY * 0.25
WHERE AGE IN (
    SELECT AGE
    FROM CUSTOMERS_BKP
    WHERE AGE >= 27
);
```
Tabela po aktualizacji:

+----+---------+-----+-----------+----------+
| ID | NAME    | AGE | ADDRESS   | SALARY   |
+----+---------+-----+-----------+----------+
|  1 | Ramesh  | 35  | Ahmedabad |   125.00 |
|  2 | Khilan  | 25  | Delhi     |  1500.00 |
|  3 | Kaushik | 23  | Kota      |  2000.00 |
|  4 | Chaitali| 25  | Mumbai    |  6500.00 |
|  5 | Hardik  | 27  | Bhopal    |  2125.00 |
|  6 | Komal   | 22  | MP        |  4500.00 |
|  7 | Muffy   | 24  | Indore    | 10000.00 |
+----+---------+-----+-----------+----------+


3. Subquery w DELETE
```sql
DELETE FROM CUSTOMERS
WHERE AGE IN (
    SELECT AGE
    FROM CUSTOMERS_BKP
    WHERE AGE >= 27
);
```
Tabela po usunięciu:

+----+---------+-----+---------+----------+
| ID | NAME    | AGE | ADDRESS | SALARY   |
+----+---------+-----+---------+----------+
|  2 | Khilan  | 25  | Delhi   |  1500.00 |
|  3 | Kaushik | 23  | Kota    |  2000.00 |
|  4 | Chaitali| 25  | Mumbai  |  6500.00 |
|  6 | Komal   | 22  | MP      |  4500.00 |
|  7 | Muffy   | 24  | Indore  | 10000.00 |
+----+---------+-----+---------+----------+


