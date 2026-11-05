# Zadanie 09: Ładowanie zamówień odporne na ponowne uruchomienie

**Środowisko:** Microsoft SQL Server, T-SQL.

**Źródło:** `AdventureWorks2022.Sales.SalesOrderHeader`.

**Cel:** `AdventureWorksETL.stg.SalesOrderHeader`.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks. Pliki SQL w tym folderze są przeznaczone na własne rozwiązanie i jego kontrolę.

## Cel ćwiczenia

Rozbuduj ładowanie z zadania 08 tak, aby można było wielokrotnie uruchamiać je dla tej samej paczki danych. Proces ma dopisywać wyłącznie brakujące zamówienia z 2013 roku, zachowując rekordy już obecne w tabeli docelowej.

Przy niezmienionym źródle ponowne uruchomienie po udanym ładowaniu powinno pozostawić taki sam stan danych i zakończyć się bez błędu. Tę właściwość nazywamy **idempotencją**. W tym ćwiczeniu sprawdzamy kolejne, pojedyncze uruchomienia skryptu.

## Stan początkowy

- Baza, schemat i tabela docelowa zostały utworzone w zadaniu 08.
- Tabela docelowa zawiera komplet zamówień z 2013 roku. W danych używanych podczas dotychczasowych ćwiczeń było to **14 182** rekordy.
- `SalesOrderID` jest kluczem głównym tabeli docelowej i przechowuje identyfikator ze źródła.
- Kolumny docelowe to `SalesOrderID`, `CustomerID`, `OrderDate` i `SubTotal`.

## Wymagania

1. Pobierz zamówienia z pełnego roku kalendarzowego 2013.
2. Rozpoznaj, które z ich identyfikatorów `SalesOrderID` nie występują jeszcze w tabeli docelowej. Tylko te zamówienia przekaż do wstawienia.
3. Dla dopisywanych zamówień zachowaj wszystkie cztery wartości ze źródła, w tym oryginalny identyfikator, godzinę daty i część ułamkową kwoty.
4. Istniejące wiersze docelowe pozostaw bez zmian.
5. Zachowaj klucz główny. Kolejne uruchomienie skryptu ma zakończyć się poprawnie, również gdy wszystkie zamówienia są już załadowane.
6. Dane źródłowe pozostaw bez zmian.
7. Skrypt ładowania ma korzystać z istniejącej tabeli. Nie usuwaj jej, nie opróżniaj i nie odtwarzaj przed ładowaniem.
8. Dla każdego uruchomienia pokaż liczbę dodanych wierszy.

W tym etapie istniejące rekordy nie wymagają aktualizacji: źródło pozostaje niezmienione. Obsługę zmian wartości przećwiczymy osobno.

## Kontrola poprawności

Przygotuj kontrole w osobnym pliku i wykonuj scenariusze w podanej kolejności.

### 1. Ponowne ładowanie kompletnej paczki

- Sprawdź początkową liczbę rekordów i sumę `SubTotal` w celu. Porównaj je ze źródłem ograniczonym do 2013 roku.
- Uruchom swój skrypt ładowania.
- Oczekiwany wynik: **0 dodanych wierszy**, brak błędu, liczba rekordów i suma pozostają bez zmian.

### 2. Uzupełnienie trzech brakujących zamówień

- Wybierz trzy istniejące zamówienia z tabeli docelowej i zapisz ich identyfikatory oraz wartości wszystkich czterech kolumn.
- Usuń dokładnie te trzy wiersze **wyłącznie z tabeli `AdventureWorksETL.stg.SalesOrderHeader`**. Jest to kontrolowane przygotowanie testu; polecenie usuwania umieść w pliku kontrolnym, poza skryptem ładowania.
- Potwierdź, że liczba rekordów w celu spadła o 3, a zamówienia nadal istnieją w źródle. Przy stanie początkowym 14 182 rekordów cel powinien zawierać teraz **14 179** rekordów.
- Uruchom ten sam skrypt ładowania, bez zmiany jego treści.
- Oczekiwany wynik: **3 dodane wiersze** i ponownie **14 182** rekordy w celu.
- Porównaj przywrócone wiersze ze źródłem, sprawdzając wszystkie cztery kolumny. Ponownie porównaj sumę `SubTotal` dla całej paczki.

### 3. Kolejne uruchomienie po uzupełnieniu

- Ponownie uruchom skrypt ładowania.
- Oczekiwany wynik: **0 dodanych wierszy**, brak błędu i niezmieniony stan celu.

## Organizacja folderu

Docelowy układ po dodaniu własnego rozwiązania:

```text
exercises/
└── 009_idempotent_etl_load/
    ├── README.md
    ├── zadanie9.sql
    └── kontrola.sql
```

- `README.md` — polecenie, wymagania i scenariusze kontroli.
- `zadanie9.sql` — właściwy skrypt ładowania brakujących zamówień, przeznaczony do wielokrotnego uruchamiania.
- `kontrola.sql` — zapytania sprawdzające oraz wyraźnie wydzielone przygotowanie testu z usunięciem trzech wierszy z celu. Ten etap wykonuj świadomie jako osobny fragment.

## Do przedstawienia

- Własny skrypt ładowania.
- Skrypt kontrolny i wybrane trzy identyfikatory zamówień.
- Wyniki trzech scenariuszy: **0 → 3 → 0 dodanych wierszy**.
- Porównanie liczby rekordów, sumy `SubTotal` oraz wartości przywróconych zamówień.
