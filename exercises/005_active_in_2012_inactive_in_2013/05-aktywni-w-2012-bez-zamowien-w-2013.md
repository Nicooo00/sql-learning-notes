# Zadanie 05: Klienci aktywni w 2012, bez zamówień w 2013

**Baza źródłowa:** `AdventureWorks2022`.

**Środowisko:** Microsoft SQL Server, T-SQL.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks.

**Tabele:** `Sales.Customer` i `Sales.SalesOrderHeader`.

Dział sprzedaży chce znaleźć klientów, którzy **złożyli przynajmniej jedno zamówienie w 2012 roku, ale nie złożyli żadnego w 2013 roku**.

## Kolumny wyniku

| Kolumna | Znaczenie |
| --- | --- |
| `CustomerID` | Identyfikator klienta |
| `OrderCount2012` | Liczba zamówień klienta w 2012 roku |
| `TotalSubTotal2012` | Suma wartości `SubTotal` tych zamówień |
| `LastOrderDate2012` | Data ostatniego zamówienia klienta w 2012 roku |

## Wymagania

1. Jeden wiersz wyniku ma odpowiadać jednemu klientowi.
2. Uwzględnij pełne lata kalendarzowe 2012 i 2013.
3. Klient musi mieć przynajmniej jedno zamówienie w 2012 i żadnego w 2013.
4. Zwróć wszystkich klientów spełniających warunki.
5. Posortuj wynik według `TotalSubTotal2012` malejąco, a przy remisie według `CustomerID` rosnąco.

## Kontrola poprawności

- Wybierz jednego klienta z wyniku i osobnym zapytaniem pokaż jego zamówienia z obu lat.
- Potwierdź obecność zamówień w 2012 i ich brak w 2013.
- Porównaj liczbę zamówień, ich sumę i ostatnią datę z wartościami w raporcie.
