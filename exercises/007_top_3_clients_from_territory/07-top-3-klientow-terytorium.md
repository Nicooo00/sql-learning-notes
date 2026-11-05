# Zadanie 07: Trzech najlepszych klientów każdego terytorium

**Baza źródłowa:** `AdventureWorks2022`.

**Środowisko:** Microsoft SQL Server, T-SQL.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks.

**Tabele:** `Sales.SalesOrderHeader` i `Sales.SalesTerritory`.

Dla **każdego terytorium osobno** znajdź trzech klientów o największej łącznej wartości `SubTotal` zamówień z **2013 roku**.

## Kolumny wyniku

| Kolumna | Znaczenie |
| --- | --- |
| `TerritoryID` | Identyfikator terytorium |
| `TerritoryName` | Nazwa terytorium |
| `CustomerID` | Identyfikator klienta |
| `OrderCount` | Liczba jego zamówień na tym terytorium w 2013 roku |
| `TotalSubTotal` | Suma wartości tych zamówień |
| `TerritoryPosition` | Pozycja klienta na tym terytorium: 1, 2 lub 3 |

## Wymagania

1. Uwzględnij pełny rok 2013.
2. Jeden wiersz wyniku ma odpowiadać jednej parze **terytorium–klient**.
3. Ustal pozycje osobno dla każdego terytorium, według sumy sprzedaży malejąco.
4. Przy jednakowej sumie wyższą pozycję otrzymuje klient z mniejszym `CustomerID`.
5. Zwróć dokładnie trzech klientów na terytorium; jeśli klientów jest mniej, zwróć wszystkich dostępnych.
6. Posortuj wynik według `TerritoryID` rosnąco, następnie według `TerritoryPosition` rosnąco.

## Kontrola poprawności

- Wybierz jedno terytorium.
- Osobnym zapytaniem przygotuj podsumowanie wszystkich jego klientów za 2013 rok, uporządkowane według zasad zadania.
- Pierwsze trzy osoby oraz ich liczby zamówień i wartości sprzedaży powinny odpowiadać raportowi.
