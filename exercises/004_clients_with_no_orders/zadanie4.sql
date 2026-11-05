--Zadanie 4
WITH CTE_zad4 AS
(
	SELECT
		c.CustomerID,
		COUNT(oh.SalesOrderID) OrderCount,
		ISNULL(SUM(SubTotal),0) TotalSubTotal
	FROM Sales.Customer c
	LEFT JOIN Sales.SalesOrderHeader oh ON
	c.CustomerID = oh.CustomerID AND
	OrderDate >= '2013-01-01' AND
	OrderDate < '2014-01-01'
	GROUP BY c.CustomerID
	ORDER BY CustomerID ASC -- na czas sprawdzania sumy zawownien trzeba zakomentowac
)
SELECT
	SUM(OrderCount) [checkCTEcount]
FROM CTE_zad4;

SELECT 
	COUNT(*) [checkOHcount]
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2013-01-01'
   AND OrderDate < '2014-01-01';