# 007 - Sortowanie i grupowanie wyników z ORDER BY i GROUP BY

## Opis
W tym rozdziale poznasz, jak sortować oraz grupować wyniki zapytań SQL za pomocą klauzul ORDER BY oraz GROUP BY. Nauczysz się również używać klauzuli HAVING, która pozwala filtrować grupy utworzone przez GROUP BY.

### ORDER BY
- Klauzula ORDER BY służy do sortowania wyników zapytania według jednej lub więcej kolumn.
- Składnia:
```sql
SELECT kolumny
FROM tabela
ORDER BY kolumna1 [ASC|DESC], kolumna2 [ASC|DESC], ...
```
- Domyślny porządek sortowania to rosnący (ASC), który można pominąć.
- Aby posortować malejąco, używamy DESC.
- Jeśli nie podasz ORDER BY, wyniki zwykle są zwracane w kolejności fizycznej lub według klucza głównego (np. id).
- Przykład:
```sql
SELECT id, username FROM users ORDER BY username ASC;
```
- Można sortować po wielu kolumnach, np. najpierw po username, potem po id:
```sql
SELECT id, username FROM users ORDER BY username ASC, id DESC;
```

### GROUP BY
- GROUP BY grupuje wiersze na podstawie wskazanych kolumn, aby umożliwić agregację danych (np. zliczanie, sumowanie).
- Typowe funkcje agregujące to: COUNT(), SUM(), MIN(), MAX(), AVG().
- Po użyciu GROUP BY w zapytaniu można zwracać tylko kolumny grupujące oraz agregujące.
- Przykład: policz ile jest użytkowników o każdym unikalnym username:
```sql
SELECT username, COUNT(*) as user_count
FROM users
GROUP BY username;
```
- Wynik pokazuje każdą unikalną nazwę i ilość jej wystąpień.

### HAVING
- Klauzula HAVING działa podobnie do WHERE, ale filtruje wyniki po grupowaniu (GROUP BY).
- Używa się jej do ograniczenia grup spełniających warunki na agregatach.
- Przykład: wyświetl tylko te username, które występują więcej niż raz:
```sql
SELECT username, COUNT(*) as user_count
FROM users
GROUP BY username
HAVING COUNT(*) > 1;
```

### Różnice między WHERE i HAVING
|Cecha	                            WHERE                           	       HAVING
|Filtrowanie	       | Filtrowanie wierszy przed grupowaniem |  Filtrowanie grup po agregacji
|Możliwość agregacji   | Nie można używać funkcji agregujących |  Można używać funkcji agregujących
|Kolejność w zapytaniu | Przed GROUP BY	                       |   Po GROUP BY


### Praktyczne wskazówki
- ORDER BY można użyć zarówno z GROUP BY, jak i bez niego.

- WHERE zawsze idzie przed GROUP BY.

- HAVING jest potrzebne tylko wtedy, gdy chcemy filtrować wyniki na podstawie agregatów.

- Staraj się zawsze precyzyjnie wybierać kolumny do grupowania, aby uniknąć niejednoznacznych wyników.

- Sortowanie dużych zbiorów danych może być kosztowne, więc używaj ORDER BY rozważnie.