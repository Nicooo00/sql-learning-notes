# Zadanie 06: Klienci, którzy zwiększyli wartość zakupów

**Baza źródłowa:** `AdventureWorks2022`.

**Środowisko:** Microsoft SQL Server, T-SQL.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks.

**Tabela:** `Sales.SalesOrderHeader`.

Znajdź klientów, którzy **zamawiali zarówno w 2012, jak i w 2013 roku**, a ich łączna wartość zamówień w 2013 była **większa niż w 2012**.

## Kolumny wyniku

| Kolumna | Znaczenie |
| --- | --- |
| `CustomerID` | Identyfikator klienta |
| `TotalSubTotal2012` | Suma `SubTotal` zamówień z 2012 roku |
| `TotalSubTotal2013` | Suma `SubTotal` zamówień z 2013 roku |
| `SalesDifference` | Suma z 2013 minus suma z 2012 |
| `LastOrderDate2013` | Data ostatniego zamówienia klienta w 2013 roku |

## Wymagania

1. Jeden wiersz wyniku ma odpowiadać jednemu klientowi.
2. Klient musi mieć przynajmniej jedno zamówienie w każdym z obu lat.
3. Uwzględnij pełne lata kalendarzowe 2012 i 2013.
4. Zwróć wszystkich klientów spełniających warunki; `SalesDifference` musi być dodatnie.
5. Posortuj wynik według `SalesDifference` malejąco, a przy remisie według `CustomerID` rosnąco.

## Kontrola poprawności

- Wybierz jednego klienta z wyniku.
- Osobnymi zapytaniami sprawdź jego sumę zamówień w każdym roku oraz ostatnią datę zamówienia w 2013.
- Porównaj je z raportem i sprawdź obliczoną różnicę.
