USE AdventureWorksETL
GO

SELECT
    SalesOrderID,
    CustomerID,
    OrderDate,
    SubTotal
FROM stg.SalesOrderHeaderBatch;
-- skrypt przedstawiajacy zawartosc tabeli stg.SalesOrderHeaderBatch

SELECT
	(SELECT 
		SUM(SubTotal) as[SumEtl]
	FROM stg.SalesOrderHeader) - 
	(SELECT
		SUM(SubTotal) as [SumOrigin]
	FROM AdventureWorks2022.Sales.SalesOrderHeader
	WHERE OrderDate  >= '2013-01-01'
	AND   OrderDate  <  '2014-01-01') as [difference];
-- sprawdza roznice w miedzy suma stg.SalesOrderHeader i Sales.SalesOrderHeader




-- Aby sprawdzic dzialanie skryptu nalezy najpiew wykonac skrypt 
-- przygotowanie.sql. Nastepnie wykonujemy pierwszy ze sktyptow z 
-- zadanie10.sql. Updatuje on wiersze w sposob opisany w zadaniu.
-- Aby cofnac te zmiany nalezy wykonac drugi zawarty w tym pliku skrypt.
-- Do kontroli danych po poszegolnych etapach sluza skrypty
-- zawarte w tym pliku.