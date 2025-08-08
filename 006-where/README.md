# 006-WHERE - SQL WHERE Clause

## Opis

Klauzula `WHERE` pozwala na filtrowanie danych w zapytaniu SQL, zwracając tylko te wiersze, które spełniają określone warunki.

`WHERE` dodajemy po klauzuli `FROM`.

## Składnia

```sql
SELECT kolumna FROM tabela WHERE warunek;
```

Przykłady
Zakładając tabelę users, chcemy wybrać tylko aktywnych użytkowników:
```sql
SELECT DISTINCT username, email, active FROM users WHERE active=true;
```
Wynik:

username	email	active
bobby	b@devdojo.com	1
tony	t@devdojo.com	1

Użytkownicy nieaktywni:
```sql
SELECT username, email, active FROM users WHERE active=false;
```
Wynik:

username	email	active
devdojo	d@devdojo.com	0

Użytkownicy o nazwie bobby:
```sql
SELECT username, email, active FROM users WHERE username='bobby';
```
Możemy też stosować operatory porównania:
=, !=, >, <, >=, <=

Operator AND
Wybiera wiersze spełniające oba warunki:
```sql
SELECT * FROM users WHERE username='bobby' AND active=true;
```

Operator OR
Wybiera wiersze spełniające przynajmniej jeden z warunków:
```sql
SELECT * FROM users WHERE username='bobby' OR active=false;
```

Operator LIKE
Dopasowanie wzorca (wildcards % i _):
```sql
SELECT * FROM users WHERE username LIKE '%y%';
```

Operator IN
Wybiera wiersze, gdzie kolumna ma jedną z wartości z listy:
```sql
SELECT * FROM users WHERE username IN ('bobby', 'devdojo');
```

Operator IS
Do sprawdzania wartości NULL:
```sql
SELECT * FROM users WHERE about IS NULL;
SELECT * FROM users WHERE about IS NOT NULL;
```

Operator BETWEEN
Wybiera wartości z zakresu (włączając granice):
```sql
SELECT * FROM users WHERE id BETWEEN 3 AND 6;
```
