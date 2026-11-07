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

SELECT
    oh.*
FROM stg.SalesOrderHeader AS oh
INNER JOIN stg.SalesOrderHeaderBatch AS ohb
    ON oh.SalesOrderID = ohb.SalesOrderID
WHERE oh.SubTotal <> ohb.SubTotal;
-- sprawdza ktore wiersze sie roznia od paczki

SELECT
    oh.*
FROM stg.SalesOrderHeader oh
INNER JOIN AdventureWorks2022.Sales.SalesOrderHeader Aoh
    ON oh.SalesOrderID = Aoh.SalesOrderID
WHERE oh.SubTotal <> Aoh.SubTotal
-- sprawdza ktore wiersze roznia sie od orginalu

SELECT
    COUNT(*) [iloscRekordow]
FROM stg.SalesOrderHeader;
-- sprawdza ilosc rekordow

