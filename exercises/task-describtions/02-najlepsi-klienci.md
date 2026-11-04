# Zadanie 02: Najlepsi klienci

**Baza źródłowa:** `AdventureWorks2022`.

**Środowisko:** Microsoft SQL Server, T-SQL.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks.

**Tabela:** `Sales.SalesOrderHeader`.

Przygotuj zestawienie **10 klientów o największej łącznej wartości zamówień złożonych w 2013 roku**. Uwzględnij wyłącznie klientów, którzy w tym roku złożyli **co najmniej 5 zamówień**.

## Kolumny wyniku

| Kolumna | Znaczenie |
| --- | --- |
| `CustomerID` | Identyfikator klienta |
| `OrderCount` | Liczba zamówień klienta w 2013 roku |
| `TotalSubTotal` | Suma wartości `SubTotal` tych zamówień |
| `AverageSubTotal` | Średnia wartość `SubTotal` jednego zamówienia |

## Wymagania

1. Uwzględnij cały rok 2013.
2. Każdy klient w wyniku musi mieć co najmniej 5 zamówień w tym okresie.
3. Zwróć 10 klientów o największej łącznej wartości zamówień.
4. Uporządkuj wynik według `TotalSubTotal` malejąco, a przy remisie według `CustomerID` rosnąco.
5. Jeden wiersz wyniku ma odpowiadać jednemu klientowi.

## Kontrola poprawności

- Dla wybranego klienta osobnym zapytaniem sprawdź liczbę, sumę i średnią wartość zamówień z 2013 roku.
- Porównaj te wartości z raportem.
