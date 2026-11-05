# Zadanie 04: Klienci bez zamówień też mają się pojawić

**Baza źródłowa:** `AdventureWorks2022`.

**Środowisko:** Microsoft SQL Server, T-SQL.

Autorskie polecenie przygotowane z pomocą ChatGPT do nauki na przykładowej bazie Microsoft AdventureWorks.

**Tabele:** `Sales.Customer` i `Sales.SalesOrderHeader`.

W obu tabelach klienta identyfikuje `CustomerID`.

Przygotuj zestawienie **wszystkich klientów**, pokazujące ich zamówienia z **2013 roku**. Uwzględnij również klientów, którzy w tym okresie niczego nie zamówili.

## Kolumny wyniku

| Kolumna | Znaczenie |
| --- | --- |
| `CustomerID` | Identyfikator klienta |
| `OrderCount` | Liczba zamówień klienta w 2013 roku |
| `TotalSubTotal` | Suma wartości `SubTotal` tych zamówień |

## Wymagania

1. Uwzględnij cały rok 2013.
2. Jeden wiersz wyniku ma odpowiadać jednemu klientowi.
3. Dla klienta bez zamówień w 2013 roku `OrderCount` i `TotalSubTotal` mają wynosić **0**.
4. Zwróć wszystkich klientów, bez ograniczenia do pierwszych 10.
5. Posortuj wynik według `CustomerID` rosnąco.

## Kontrola poprawności

- Liczba wierszy zestawienia powinna być równa liczbie rekordów w `Sales.Customer`.
- Suma kolumny `OrderCount` powinna odpowiadać liczbie wszystkich zamówień z 2013 roku w `Sales.SalesOrderHeader`.
- Sprawdź klienta bez zamówień w 2013 roku: powinien występować w raporcie z dwiema wartościami równymi 0.
