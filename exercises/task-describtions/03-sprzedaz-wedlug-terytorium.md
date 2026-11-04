# Zadanie 03: Sprzedaż według terytorium

**Baza źródłowa:** `AdventureWorks2022`.

**Środowisko:** Microsoft SQL Server, T-SQL.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks.

**Tabele:**

- `Sales.SalesOrderHeader` — zamówienia, w tym `TerritoryID`.
- `Sales.SalesTerritory` — terytoria; `TerritoryID` jest identyfikatorem, a `Name` nazwą.

Przygotuj zestawienie sprzedaży **za rok 2013**, podsumowane według terytorium.

## Kolumny wyniku

| Kolumna | Znaczenie |
| --- | --- |
| `TerritoryID` | Identyfikator terytorium |
| `TerritoryName` | Nazwa terytorium |
| `OrderCount` | Liczba zamówień na terytorium w 2013 roku |
| `TotalSubTotal` | Suma wartości `SubTotal` tych zamówień |
| `AverageSubTotal` | Średnia wartość `SubTotal` jednego zamówienia |

## Wymagania

1. Uwzględnij cały rok 2013.
2. Uwzględnij tylko terytoria, które miały przynajmniej jedno zamówienie w tym okresie.
3. Uporządkuj wynik według `TotalSubTotal` malejąco, a przy remisie według `TerritoryID` rosnąco.
4. Jeden wiersz wyniku ma odpowiadać jednemu terytorium.

## Kontrola poprawności

- Dla wybranego `TerritoryID` osobnym zapytaniem policz zamówienia oraz ich sumę i średnią wartość w 2013 roku.
- Porównaj wyniki z odpowiednim wierszem raportu.
