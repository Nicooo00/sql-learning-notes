--Zadanie 1

SELECT TOP 10
	SalesOrderID,
	OrderDate,
	CustomerId,
	SubTotal
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2013-01-01'
  AND OrderDate < '2014-01-01'
ORDER BY 
	SubTotal DESC,
	SalesOrderID ASC