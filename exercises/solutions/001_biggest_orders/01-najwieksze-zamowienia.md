# Zadanie 01: Największe zamówienia

**Baza źródłowa:** `AdventureWorks2022`.

**Środowisko:** Microsoft SQL Server, T-SQL.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks.

**Tabela:** `Sales.SalesOrderHeader`.

Dział sprzedaży chce zobaczyć **10 zamówień o najwyższej wartości `SubTotal`, złożonych w 2013 roku**.

## Kolumny wyniku

| Kolumna | Znaczenie |
| --- | --- |
| `SalesOrderID` | Identyfikator zamówienia |
| `OrderDate` | Data złożenia zamówienia |
| `CustomerID` | Identyfikator klienta |
| `SubTotal` | Wartość zamówienia bez podatku i kosztu transportu |

## Wymagania

1. Uwzględnij cały rok 2013.
2. Zwróć dokładnie 10 zamówień.
3. Uporządkuj je od najwyższego `SubTotal`.
4. Przy jednakowej wartości pierwszeństwo ma zamówienie z mniejszym `SalesOrderID`.
5. Jeden wiersz wyniku ma odpowiadać jednemu zamówieniu.

## Kontrola poprawności

- Sprawdź liczbę zwróconych wierszy i daty zamówień.
- Sprawdź kolejność wartości `SubTotal` oraz sposób rozstrzygania remisów.
