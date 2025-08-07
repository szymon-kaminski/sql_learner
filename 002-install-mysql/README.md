# 002 – Instalacja MySQL na Windows (i test połączenia)

Ten krok pokaże Ci, jak zainstalować **MySQL Community Server** na Windows oraz sprawdzić, czy działa poprawnie.

---

## 1. Pobierz i zainstaluj MySQL

1. Przejdź na oficjalną stronę:
    https://dev.mysql.com/downloads/installer/

2. Wybierz wersję:
   - **Windows (x86, 64-bit), MySQL Installer**
   - Pobierz wersję "web" (~2 MB) lub "offline" (~400 MB)

3. Uruchom instalator jako administrator.

---

## 2. Wybierz typ instalacji

 Zaznacz opcję: `Developer Default`  
 Zainstaluje serwer + klienta + narzędzia (np. Workbench)

---

## 3. Ustaw hasło do root

W kroku konfiguracji serwera:
- Ustaw hasło np. `admin123` (albo inne, które zapamiętasz)
- Zapisz je w bezpiecznym miejscu (będzie potrzebne!)

---

## 4. Dokończ instalację i uruchom Workbench

Po instalacji:
- MySQL Server zostanie uruchomiony jako usługa systemowa
- Otwórz **MySQL Workbench** (graficzny interfejs)

---

## 5. Sprawdź połączenie

Po uruchomieniu Workbench:
- Kliknij w ikonę "Local Instance MySQL"
- Wpisz swoje hasło do użytkownika `root`
- Jeśli wszystko działa – zobaczysz panel do wpisywania zapytań SQL

---

## 6. Przetestuj zapytanie

Wklej i uruchom zapytanie:

```sql
SELECT VERSION();
