# Redis to klasyk w świecie NoSQL!
 zwłaszcza w kontekście cache’owania i szybkiego dostępu do danych. 
 
## Pokażę Ci krok po kroku jak:
- połączyć się z Redisem w Pythonie, 
- dodać dane,
- odczytać dane.

### Krok 1: Instalacja Redisa
Musisz mieć zainstalowanego Redisa lokalnie albo skorzystać z Dockera.
Najprościej uruchomić w Dockerze:
```bash
docker run --name redis -p 6379:6379 -d redis
```
To wystawi Ci serwer Redis na porcie 6379.

###  Krok 2: Instalacja klienta Redis dla Pythona
W Pythonie użyjemy biblioteki redis-py:
```bash
pip install redis
```

### Krok 3: Połączenie z Redisem
W Pythonie najprostsze połączenie wygląda tak:
```bash
import redis

# Połączenie do lokalnego serwera Redis
r = redis.Redis(
    host='localhost',
    port=6379,
    decode_responses=True  # żeby wartości były stringami, nie bajtami
)

# Sprawdzenie czy działa
print("Ping:", r.ping())  # True oznacza, że serwer odpowiada
```

### Krok 4: Dodawanie i odczytywanie danych
Redis działa na zasadzie klucz → wartość.
```bash
# Zapisanie wartości
r.set("user:1001", "Jan Kowalski")
r.set("user:1002", "Anna Nowak")

# Pobranie wartości
print("user:1001 =", r.get("user:1001"))
print("user:1002 =", r.get("user:1002"))

# Inny przykład: licznik
r.set("page_views", 0)
r.incr("page_views")  # zwiększ o 1
r.incr("page_views")
print("page_views =", r.get("page_views"))
```

Oczekiwany wynik:
```bash
Ping: True
user:1001 = Jan Kowalski
user:1002 = Anna Nowak
page_views = 2
```

### Krok 5: Inne typy danych w Redis
Redis obsługuje nie tylko stringi, ale też listy, zestawy i hashe:
```bash
# Lista
r.rpush("queue", "task1")
r.rpush("queue", "task2")
print("Lista queue =", r.lrange("queue", 0, -1))  # ['task1', 'task2']

# Hash (słownik)
r.hset("user:1003", mapping={"name": "Piotr", "age": 28})
print("Hash user:1003 =", r.hgetall("user:1003"))
```