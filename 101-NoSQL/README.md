# Typy baz NoSQL

## Wprowadzenie
Tradycyjne bazy danych SQL przechowują dane w tabelach (wiersze i kolumny), ale współczesne aplikacje (media społecznościowe, IoT, systemy chmurowe) potrzebują większej elastyczności i skalowalności.
Dlatego powstały bazy NoSQL, które obsługują duże ilości danych nieustrukturyzowanych i półustrukturyzowanych.

Główne typy baz NoSQL:

Document-based (dokumentowe)

Key-Value Stores (klucz-wartość)

Column-oriented (kolumnowe)

Graph-based (grafowe)

## 1. Document-Based Databases (bazy dokumentowe)
Dane przechowywane w postaci dokumentów (np. JSON, BSON, XML).

Zamiast tabel mamy kolekcje dokumentów.

Schemat elastyczny – każdy dokument może wyglądać inaczej.

Nie ma kluczy obcych (dokumenty są niezależne).

### Zalety:

Łatwość odwzorowania danych obiektowych (np. z aplikacji w JavaScript).

Szybkie tworzenie i modyfikacja dokumentów.

Dobre do danych półustrukturyzowanych.

### Przykład JSON dokumentu użytkownika w MongoDB:

```bash
{
  "user_id": 123,
  "name": "Anna Kowalska",
  "email": "anna@example.com",
  "orders": [
    {"id": 1, "product": "Laptop", "price": 3000},
    {"id": 2, "product": "Myszka", "price": 120}
  ]
}
```

### Popularne bazy i zastosowania:

MongoDB → katalogi produktów, profile użytkowników.

CouchDB → aplikacje offline (np. mobilne).

Firebase Firestore → aplikacje w czasie rzeczywistym (czaty).

## 2. Key-Value Stores (bazy klucz-wartość)
Najprostsza forma bazy NoSQL.

Dane zapisane w parach: klucz → wartość.

Klucz jest unikalny, wartością może być liczba, string, albo złożony obiekt.

### Zalety:

Ekstremalnie szybkie odczyty (dostęp po kluczu).

Łatwa skalowalność pozioma.

Świetne do cache’owania i danych sesyjnych.

### Przykład (Redis):

```sql
SET user:1001 "Jan Nowak"
GET user:1001
Zwróci "Jan Nowak"
```

### Popularne bazy i zastosowania:

Redis → sesje użytkowników, rankingi na żywo.

Memcached → cache stron internetowych.

Amazon DynamoDB → aplikacje chmurowe na dużą skalę.

## 3. Column-Oriented Databases (bazy kolumnowe)
Dane przechowywane w kolumnach zamiast wierszy.

Idealne do analizy dużych zbiorów danych – odczyt tylko potrzebnych kolumn.

Wysoka kompresja danych i wydajne zapytania.

### Zalety:

Bardzo dobre w analizie Big Data.

Szybsze zapytania analityczne niż wierszowe bazy SQL.

Skalowalne i zoptymalizowane pod analitykę.

### Przykład:
Zamiast:

ID | Name   | Age | City
1  | Anna   | 25  | Kraków
2  | Marek  | 31  | Warszawa

Dane są przechowywane jako:

Kolumna ID: [1, 2]

Kolumna Name: [Anna, Marek]

Kolumna Age: [25, 31]

Kolumna City: [Kraków, Warszawa]

### Popularne bazy i zastosowania:

Apache Cassandra → analiza w czasie rzeczywistym, IoT.

Google Bigtable → dane szeregów czasowych, ML.

HBase → część ekosystemu Hadoop.

## 4.  Graph-Based Databases (bazy grafowe)
Dane przechowywane jako węzły (nodes) i relacje (edges).

Idealne tam, gdzie relacje są tak samo ważne jak dane.

Umożliwiają szybkie zapytania grafowe (np. „znajomi znajomych”).

### Zalety:

Świetne do sieci społecznościowych, wykrywania oszustw, rekomendacji.

Bardzo szybkie w analizie powiązań.

Elastyczny schemat.

### Przykład (Neo4j, zapytanie Cypher):

```sql
MATCH (u:User {name: "Anna"})-[:FRIEND]->(f)
RETURN f.name
```
Zwróci listę znajomych Anny.

### Popularne bazy i zastosowania:

Neo4j → sieci społecznościowe, wykrywanie fraudów.

Amazon Neptune → grafy wiedzy, AI.

ArangoDB → baza wielomodelowa (obsługuje też dokumenty).

## Podsumowanie – porównanie typów NoSQL
```txt
| Typ bazy     | Model danych           | Najlepsze zastosowanie       | Przykłady             |
|--------------|------------------------|------------------------------|-----------------------|
| Dokumentowe  | JSON, BSON, XML        | Dane półustrukturyzowane     | MongoDB, CouchDB      |
| Klucz–wartość| Para klucz → wartość   | Cache, szybkie lookup’y      | Redis, DynamoDB       |
| Kolumnowe    | Kolumny zamiast wierszy| Big Data, analityka          | Cassandra, HBase      |
| Grafowe      | Węzły i relacje        | Dane złożone relacyjnie      | Neo4j, Neptune        |
```