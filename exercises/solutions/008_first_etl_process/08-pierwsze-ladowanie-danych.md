# Zadanie 08: Pierwsze ładowanie zamówień do tabeli pośredniej

**Baza źródłowa:** `AdventureWorks2022`.

**Środowisko:** Microsoft SQL Server, T-SQL.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks.

**Źródło:** `AdventureWorks2022.Sales.SalesOrderHeader`.

**Cel:** `AdventureWorksETL.stg.SalesOrderHeader`.

Przygotuj pierwszy etap procesu ETL: **zapisz paczkę zamówień z 2013 roku w osobnej bazie**, aby kolejne etapy mogły pracować na załadowanych danych.

## Kolumny tabeli docelowej

| Kolumna | Znaczenie |
| --- | --- |
| `SalesOrderID` | Identyfikator zamówienia ze źródła |
| `CustomerID` | Identyfikator klienta |
| `OrderDate` | Data i godzina złożenia zamówienia |
| `SubTotal` | Wartość zamówienia bez podatku i kosztu transportu |

## Wymagania

1. Utwórz bazę ćwiczeniową `AdventureWorksETL` oraz schemat `stg`.
2. Utwórz tabelę `stg.SalesOrderHeader` z czterema wskazanymi kolumnami. Dobierz typy na podstawie tabeli źródłowej, zachowując godzinę daty i część ułamkową kwoty.
3. Wszystkie cztery kolumny mają być obowiązkowe. Ustanów klucz główny na `SalesOrderID`.
4. Zachowaj identyfikatory zamówień ze źródła; nie generuj dla nich nowych wartości w celu.
5. Załaduj wszystkie zamówienia z pełnego 2013 roku. Jeden wiersz w tabeli docelowej ma odpowiadać jednemu zamówieniu.
6. Dane źródłowe pozostaw bez zmian.
7. Wykonaj jedno ładowanie do pustej tabeli. Obsługa ponownego uruchomienia procesu będzie przedmiotem kolejnego ćwiczenia.

## Kontrola poprawności

- Porównaj liczbę wierszy w celu z liczbą zamówień z 2013 roku w źródle. Dla danych wykorzystanych podczas dotychczasowych ćwiczeń było to **14 182** rekordy.
- Porównaj sumę `SubTotal` w celu i w źródle dla tego samego zakresu dat. Sumy powinny być identyczne.
- Potwierdź, że do celu trafiło zamówienie klienta `29913` z **31 grudnia 2013 roku**.

## Do przedstawienia

- Skrypt tworzący bazę, schemat i tabelę.
- Skrypt ładowania danych.
- Zapytania kontrolne oraz ich wyniki.
