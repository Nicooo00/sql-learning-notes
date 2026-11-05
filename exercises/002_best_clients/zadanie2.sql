--Zadanie 2

SELECT TOP 10
	CustomerID,
	COUNT(*) OrderCount,
	SUM(SubTotal) TotalSubTotal,
	AVG(SubTotal) AverageSubTotal
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2013-01-01'
  AND OrderDate < '2014-01-01'
GROUP BY CustomerID
HAVING COUNT(*) >= 5
ORDER BY
	TotalSubTotal DESC,
	CustomerID ASC