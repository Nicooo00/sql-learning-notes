USE AdventureWorksETL

GO

CREATE SCHEMA stg

GO


CREATE TABLE [stg].[SalesOrderHeader](
	SalesOrderID INT NOT NULL,
	CustomerID INT NOT NULL,
	OrderDate DATETIME NOT NULL,
	SubTotal MONEY NOT NULL

	CONSTRAINT pk_SalesOrderID PRIMARY KEY (SalesOrderID) 
)

INSERT INTO stg.SalesOrderHeader
(
	SalesOrderID,
	CustomerID,
	OrderDate,
	SubTotal
)
SELECT 
	SalesOrderID,
	CustomerID,
	OrderDate,
	SubTotal
FROM AdventureWorks2022.Sales.SalesOrderHeader
WHERE OrderDate >= '2013-01-01' 
AND   OrderDate < '2014-01-01';

SELECT 
    COUNT(*) AS [Ilosc zamowien]
FROM stg.SalesOrderHeader;

SELECT
    CustomerID,
    OrderDate
FROM stg.SalesOrderHeader
WHERE CustomerID = 29913;


SELECT
	SUM(SubTotal) as [SumOrigin]
FROM AdventureWorks2022.Sales.SalesOrderHeader
WHERE OrderDate  >= '2013-01-01'
AND   OrderDate  <  '2014-01-01';


SELECT 
	SUM(SubTotal) as[SumEtl]
FROM stg.SalesOrderHeader;





