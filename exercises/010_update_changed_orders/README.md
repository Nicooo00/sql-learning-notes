# Zadanie 10: Aktualizacja zmienionych zamówień

**Środowisko:** Microsoft SQL Server, T-SQL.

**Źródło danych do przygotowania paczki:** `AdventureWorks2022.Sales.SalesOrderHeader`.

**Paczka wejściowa dla aktualizacji:** `AdventureWorksETL.stg.SalesOrderHeaderBatch`.

**Cel aktualizacji:** `AdventureWorksETL.stg.SalesOrderHeader` z zadań 08–09.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks. Pliki SQL są przeznaczone na własne rozwiązanie i jego kontrolę.

## Cel ćwiczenia

W zadaniu 09 proces dopisywał brakujące zamówienia. Teraz obsłuż sytuację, w której zamówienie już istnieje w celu, ale w nowej paczce przyszła inna wartość `SubTotal`.

Przygotuj skrypt aktualizujący wyłącznie rzeczywiście zmienione kwoty. Po pierwszym udanym wykonaniu ponowne uruchomienie z tą samą paczką ma pozostawić dane bez zmian i wykazać **0 zaktualizowanych wierszy**.

## Stan początkowy

- Istnieje tabela `AdventureWorksETL.stg.SalesOrderHeader` z czterema kolumnami: `SalesOrderID`, `CustomerID`, `OrderDate`, `SubTotal`.
- Cel zawiera komplet zamówień z 2013 roku załadowany w poprzednich ćwiczeniach — dla dotychczas używanych danych było to **14 182** rekordy.
- Zamówienia `51131`, `55282` i `51822` istnieją w źródle i w celu. Przed pierwszą aktualizacją ich cztery wartości mają być zgodne ze źródłem.
- `SalesOrderID` pozostaje kluczem głównym tabeli docelowej.

## Przygotowanie paczki

W pliku `scripts/przygotowanie.sql`:

1. Utwórz tabelę `AdventureWorksETL.stg.SalesOrderHeaderBatch` z tymi samymi czterema kolumnami, zgodnymi typami i obowiązkowymi wartościami. Ustanów klucz główny na `SalesOrderID`, zachowując identyfikatory ze źródła.
2. Skopiuj do niej z `AdventureWorks2022.Sales.SalesOrderHeader` wyłącznie zamówienia `51131`, `55282` i `51822`.
3. Zmień `SubTotal` wyłącznie w przygotowanej paczce, według tabeli poniżej. Punktem odniesienia są kwoty ze źródła AdventureWorks2022.

| `SalesOrderID` | Kwota `SubTotal` w paczce |
| --- | --- |
| `51131` | Kwota źródłowa powiększona o `10.00` |
| `55282` | Kwota źródłowa powiększona o `20.00` |
| `51822` | Oryginalna kwota źródłowa, bez zmian |

Pozostałe kolumny zachowaj dokładnie takie jak w źródle. Paczka ma zawierać dokładnie trzy wiersze. Nie zmieniaj danych w AdventureWorks2022 ani danych w tabeli docelowej podczas przygotowania paczki.

Przygotowanie wykonaj raz. Między pierwszym i drugim uruchomieniem właściwej aktualizacji pozostaw paczkę bez zmian.

## Wymagania dla skryptu aktualizacji

W pliku `scripts/zadanie10.sql`:

1. Czytaj dane z `AdventureWorksETL.stg.SalesOrderHeaderBatch`.
2. Identyfikuj zamówienia po `SalesOrderID`.
3. Aktualizuj `SubTotal` w celu tylko wtedy, gdy zamówienie występuje w paczce i kwota docelowa różni się od kwoty w paczce.
4. Ustaw kwotę docelową na wartość przychodzącą w paczce.
5. Zamówienie `51822`, którego kwota już jest poprawna, nie może być objęte aktualizacją.
6. Nie zmieniaj `SalesOrderID`, `CustomerID` ani `OrderDate`; pozostałe zamówienia w celu pozostaw bez zmian.
7. W tym ćwiczeniu wszystkie trzy zamówienia istnieją w celu. Skrypt nie dodaje ani nie usuwa rekordów, a liczba wierszy celu pozostaje stała.
8. Zachowaj istniejącą tabelę i jej klucz główny. Nie odtwarzaj ani nie opróżniaj celu przed wykonaniem aktualizacji.
9. Pokaż liczbę faktycznie zaktualizowanych wierszy przy każdym uruchomieniu. Skrypt modyfikujący trzy wiersze, w tym jeden na tę samą wartość, nie spełnia wymagania.

## Kontrola poprawności

Umieść kontrole w `scripts/kontrola.sql` i opisz kolejność wykonywania poszczególnych sekcji. Kontrole mają odczytywać dane; nie umieszczaj w tym pliku modyfikowania paczki ani celu.

### 1. Przed pierwszą aktualizacją

- Potwierdź, że cel zawiera wskazane trzy zamówienia z wartościami zgodnymi ze źródłem.
- Potwierdź, że paczka ma dokładnie trzy wiersze, właściwe identyfikatory i kwoty zgodne z regułami przygotowania.
- Zapisz liczbę wierszy celu i sumę `SubTotal`, aby móc porównać stan przed i po aktualizacji.

### 2. Po pierwszym uruchomieniu

- Oczekiwany wynik: **2 zaktualizowane wiersze**.
- Zamówienia `51131` i `55282` mają kwoty zgodne z paczką.
- Zamówienie `51822` zachowuje pierwotną kwotę.
- Porównaj wszystkie cztery kolumny tych trzech zamówień między celem a paczką — wartości powinny być zgodne.
- Liczba wierszy celu pozostaje bez zmian.
- Suma `SubTotal` dla całej tabeli docelowej jest większa od sumy sprzed aktualizacji o dokładnie **30.00**.

### 3. Po drugim uruchomieniu z tą samą paczką

- Uruchom ponownie dokładnie ten sam skrypt `zadanie10.sql`, bez ponownego przygotowywania danych ani przywracania wcześniejszego stanu celu.
- Oczekiwany wynik: **0 zaktualizowanych wierszy**.
- Liczba rekordów, suma `SubTotal` i wartości wskazanych zamówień pozostają takie jak po pierwszej aktualizacji.

Zwiększenie sumy względem oryginalnych zamówień AdventureWorks2022 jest w tym ćwiczeniu zamierzone: symulujemy zmianę danych w przychodzącej paczce. Po aktualizacji poprawność wskazanych zamówień sprawdzaj względem paczki.

## Organizacja folderu

Docelowy układ po dodaniu własnego rozwiązania:

```text
exercises/
└── 010_update_changed_orders/
    ├── README.md
    └── scripts/
        ├── przygotowanie.sql
        ├── zadanie10.sql
        └── kontrola.sql
```

- `README.md` — polecenie, wymagania i scenariusze kontroli.
- `scripts/przygotowanie.sql` — jednorazowe utworzenie i wypełnienie paczki z kontrolowanymi zmianami.
- `scripts/zadanie10.sql` — właściwa aktualizacja zmienionych kwot, przeznaczona do ponownego uruchamiania.
- `scripts/kontrola.sql` — osobne sekcje sprawdzające stan przed aktualizacją, po pierwszym i po drugim uruchomieniu.

## Do przedstawienia

- Własne skrypty przygotowania, aktualizacji i kontroli.
- Wyniki kolejnych uruchomień aktualizacji: **2 → 0 zaktualizowanych wierszy**.
- Porównanie wartości trzech zamówień oraz liczby rekordów i sumy `SubTotal` przed i po aktualizacji.
