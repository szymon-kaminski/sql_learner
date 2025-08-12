# 014 - SQL: UNION i UNION ALL

## UNION
`UNION` służy do łączenia wyników dwóch lub więcej zapytań `SELECT` w jeden zestaw wyników **bez duplikatów**.

**Wymagania dla UNION:**
- Ta sama liczba kolumn w każdym zapytaniu
- Te same typy danych w odpowiadających sobie kolumnach
- Ta sama kolejność kolumn

**Przykład:**
```sql
SELECT id, name, amount, date
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
UNION
SELECT id, name, amount, date
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;
```

Wynik:
```
+------+----------+--------+---------------------+
| id   | name     | amount | date                |
+------+----------+--------+---------------------+
|    1 | Ramesh   |   NULL | NULL                |
|    2 | Khilan   |   1560 | 2009-11-20 00:00:00 |
|    3 | Kaushik  |   3000 | 2009-10-08 00:00:00 |
|    3 | Kaushik  |   1500 | 2009-10-08 00:00:00 |
|    4 | Chaitali |   2060 | 2008-05-20 00:00:00 |
|    5 | Hardik   |   NULL | NULL                |
|    6 | Komal    |   NULL | NULL                |
|    7 | Muffy    |   NULL | NULL                |
+------+----------+--------+---------------------+
```

## UNION ALL
UNION ALL działa tak samo jak UNION, ale zachowuje duplikaty.

Przykład:
```sql
SELECT id, name, amount, date
FROM customers
LEFT JOIN orders
    ON customers.id = orders.customer_id
UNION ALL
SELECT id, name, amount, date
FROM customers
RIGHT JOIN orders
    ON customers.id = orders.customer_id;
```

Wynik:
```
+------+----------+--------+---------------------+
| id   | name     | amount | date                |
+------+----------+--------+---------------------+
|    1 | Ramesh   |   NULL | NULL                |
|    2 | Khilan   |   1560 | 2009-11-20 00:00:00 |
|    3 | Kaushik  |   3000 | 2009-10-08 00:00:00 |
|    3 | Kaushik  |   1500 | 2009-10-08 00:00:00 |
|    4 | Chaitali |   2060 | 2008-05-20 00:00:00 |
|    5 | Hardik   |   NULL | NULL                |
|    6 | Komal    |   NULL | NULL                |
|    7 | Muffy    |   NULL | NULL                |
|    3 | Kaushik  |   3000 | 2009-10-08 00:00:00 |
|    3 | Kaushik  |   1500 | 2009-10-08 00:00:00 |
|    2 | Khilan   |   1560 | 2009-11-20 00:00:00 |
|    4 | Chaitali |   2060 | 2008-05-20 00:00:00 |
+------+----------+--------+---------------------+
```