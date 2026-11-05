USE AdventureWorksETL


INSERT INTO stg.SalesOrderHeader
(
	SalesOrderID,
	CustomerID,
	OrderDate,
	SubTotal
)
SELECT 
	oh.SalesOrderID,
	oh.CustomerID,
	oh.OrderDate,
	oh.SubTotal
FROM AdventureWorks2022.Sales.SalesOrderHeader oh
LEFT JOIN stg.SalesOrderHeader Eoh 
ON Eoh.SalesOrderID = oh.SalesOrderID
WHERE oh.OrderDate >= '2013-01-01' 
AND   oh.OrderDate < '2014-01-01'
AND   Eoh.SalesOrderID IS NULL;