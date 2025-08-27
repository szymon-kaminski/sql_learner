# Typy baz NoSQL

## Wprowadzenie
Tradycyjne bazy danych SQL przechowują dane w tabelach (wiersze i kolumny), ale współczesne aplikacje (media społecznościowe, IoT, systemy chmurowe) potrzebują większej elastyczności i skalowalności.
Dlatego powstały bazy NoSQL, które obsługują duże ilości danych nieustrukturyzowanych i półustrukturyzowanych.

Główne typy baz NoSQL:

- Document-based (dokumentowe)

- Key-Value Stores (klucz-wartość)

- Column-oriented (kolumnowe)

- Graph-based (grafowe)


## 1. Document-Based Databases (bazy dokumentowe)
Dane przechowywane w postaci dokumentów (np. JSON, BSON, XML).

Zamiast tabel mamy kolekcje dokumentów.

Schemat elastyczny – każdy dokument może wyglądać inaczej.

Nie ma kluczy obcych (dokumenty są niezależne).

### Zalety:

- Łatwość odwzorowania danych obiektowych (np. z aplikacji w JavaScript).

- Szybkie tworzenie i modyfikacja dokumentów.

- Dobre do danych półustrukturyzowanych.

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

- MongoDB → katalogi produktów, profile użytkowników.

- CouchDB → aplikacje offline (np. mobilne).

- Firebase Firestore → aplikacje w czasie rzeczywistym (czaty).


## 2. Key-Value Stores (bazy klucz-wartość)
Najprostsza forma bazy NoSQL.

Dane zapisane w parach: klucz → wartość.

Klucz jest unikalny, wartością może być liczba, string, albo złożony obiekt.

### Zalety:

- Ekstremalnie szybkie odczyty (dostęp po kluczu).

- Łatwa skalowalność pozioma.

- Świetne do cache’owania i danych sesyjnych.

### Przykład (Redis):

```sql
SET user:1001 "Jan Nowak"
GET user:1001
Zwróci "Jan Nowak"
```

### Popularne bazy i zastosowania:

- Redis → sesje użytkowników, rankingi na żywo.

- Memcached → cache stron internetowych.

- Amazon DynamoDB → aplikacje chmurowe na dużą skalę.


## 3. Column-Oriented Databases (bazy kolumnowe)
Dane przechowywane w kolumnach zamiast wierszy.

Idealne do analizy dużych zbiorów danych – odczyt tylko potrzebnych kolumn.

Wysoka kompresja danych i wydajne zapytania.

### Zalety:

- Bardzo dobre w analizie Big Data.

- Szybsze zapytania analityczne niż wierszowe bazy SQL.

- Skalowalne i zoptymalizowane pod analitykę.

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

- Apache Cassandra → analiza w czasie rzeczywistym, IoT.

- Google Bigtable → dane szeregów czasowych, ML.

- HBase → część ekosystemu Hadoop.


## 4.  Graph-Based Databases (bazy grafowe)
Dane przechowywane jako węzły (nodes) i relacje (edges).

Idealne tam, gdzie relacje są tak samo ważne jak dane.

Umożliwiają szybkie zapytania grafowe (np. „znajomi znajomych”).

### Zalety:

- Świetne do sieci społecznościowych, wykrywania oszustw, rekomendacji.

- Bardzo szybkie w analizie powiązań.

- Elastyczny schemat.

### Przykład (Neo4j, zapytanie Cypher):

```sql
MATCH (u:User {name: "Anna"})-[:FRIEND]->(f)
RETURN f.name
```
Zwróci listę znajomych Anny.

### Popularne bazy i zastosowania:

- Neo4j → sieci społecznościowe, wykrywanie fraudów.

- Amazon Neptune → grafy wiedzy, AI.

- ArangoDB → baza wielomodelowa (obsługuje też dokumenty).



# Podsumowanie – porównanie typów NoSQL
```txt
| Typ bazy     | Model danych           | Najlepsze zastosowanie       | Przykłady             |
|--------------|------------------------|------------------------------|-----------------------|
| Dokumentowe  | JSON, BSON, XML        | Dane półustrukturyzowane     | MongoDB, CouchDB      |
| Klucz–wartość| Para klucz → wartość   | Cache, szybkie lookup’y      | Redis, DynamoDB       |
| Kolumnowe    | Kolumny zamiast wierszy| Big Data, analityka          | Cassandra, HBase      |
| Grafowe      | Węzły i relacje        | Dane złożone relacyjnie      | Neo4j, Neptune        |
```

## W SKRÓCIE

### 1. Co to jest baza danych NoSQL i jakie są główne rodzaje baz danych NoSQL?

Baza danych NoSQL to nierelacyjna baza danych, która przechowuje dane w formie nietabularycznej, czyli nie opartej na tradycyjnych tabelach. Główne rodzaje baz danych NoSQL to bazy dokumentowe, bazy klucz-wartość, bazy kolumnowe oraz bazy grafowe.

### 2. Jakie są charakterystyczne cechy document-based database i jak przechowuje dane? Podaj przykład takiej bazy.

Document-based database (baza dokumentowa) to nierelacyjna baza danych, która przechowuje dane w dokumentach, zazwyczaj w formatach JSON, BSON lub XML. Dokumenty mogą być łatwo przechowywane i odzyskiwane w formie zbliżonej do obiektów danych używanych w aplikacjach, co minimalizuje potrzebę translacji danych. Kluczową cechą są elastyczne schematy dokumentów, co oznacza, że dokumenty w bazie mogą mieć różne schematy. Przykłady: MongoDB, CouchDB.

### 3. Jakie są zalety używania key-value store i jakie są jej główne cechy? Podaj przykład takiej bazy.

Key-value store to prosta forma bazy danych NoSQL, która przechowuje elementy danych w parach klucz-wartość. Kluczowymi zaletami są prostota, skalowalność i szybkość. Dane można łatwo odzyskać za pomocą unikalnego klucza przypisanego do każdego elementu, a wartości mogą być prostymi typami danych lub złożonymi obiektami. Przykłady: Redis, Amazon DynamoDB, FoundationDB.

### 4. Czym różni się column-based database od tradycyjnej bazy relacyjnej i jakie są jej zalety? Podaj przykład takiej bazy.

W column database (baza kolumnowa) dane są przechowywane w kolumnach zamiast wierszach, co pozwala na efektywniejsze odczytywanie danych, szczególnie przy analizach skupiających się na małej liczbie kolumn. Bazy kolumnowe są zaprojektowane do efektywnego odczytywania danych i szybszego ich odzyskiwania, co sprawia, że są idealne do przechowywania dużych ilości danych. Zalety to skalowalność, kompresja i szybkość odpowiedzi. Przykłady: ClickHouse, Cassandra, HBase.

### 5. Jakie są kluczowe cechy graph-based databases i jakie korzyści przynoszą w analizie danych? Podaj przykład takiej bazy.

Bazy grafowe koncentrują się na relacjach między elementami danych, przechowując dane w formie węzłów i połączeń między nimi zwanych krawędziami lub relacjami. Pozwalają łatwo identyfikować relacje między danymi dzięki czemu łączą i oferują wyniki zapytań w czasie rzeczywistym. Dodawanie nowego węzła czy krawędzi jest prostym zadaniem, które nie wymaga znaczących zmian schematu. Są one szczególnie przydatne w aplikacjach wymagających głębokiego zrozumienia złożonych relacji między obiektami, takich jak sieci społecznościowe, rekomendacje produktów czy analizy grafów. Przykład: Neo4j, OrientDB, ArangoDB.