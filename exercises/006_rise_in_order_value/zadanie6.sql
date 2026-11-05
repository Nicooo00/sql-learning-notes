USE AdventureWorks2022


--Zadanie6

WITH [CTE_zad6_2012] AS
(
	SELECT
		CustomerID,
		SUM(SubTotal) Sum2012
	FROM Sales.SalesOrderHeader
	WHERE OrderDate >= '2012-01-01' AND
		  OrderDate <  '2013-01-01'
	GROUP BY CustomerID

), [CTE_zad6_2013] AS
(
	SELECT
		CustomerID,
		SUM(SubTotal) Sum2013,
		MAX(OrderDate) [LastOrder]
	FROM Sales.SalesOrderHeader
	WHERE OrderDate >= '2013-01-01' AND
		  OrderDate <  '2014-01-01'
	GROUP BY CustomerID
)

SELECT
	cte1.CustomerID,
	cte1.Sum2012 [TotalSubTotal2012],
	cte2.Sum2013 [TotalSubTotal2013],
	(cte2.Sum2013 - cte1.Sum2012) [SalesDifference],
	cte2.LastOrder [LastOrderDate2013]
FROM CTE_zad6_2012 cte1
INNER JOIN CTE_zad6_2013 cte2 ON
cte1.CustomerID = cte2.CustomerID AND
cte2.Sum2013 > cte1.Sum2012
ORDER BY 
	SalesDifference DESC,
	CustomerID ASC;


--Sprawdzenie

--SELECT
--	CustomerID,
--	SUM(SubTotal) Sum2012
--FROM Sales.SalesOrderHeader
--	WHERE OrderDate >= '2012-01-01' AND
--	OrderDate <  '2013-01-01' AND
--	CustomerID = 29913
--GROUP BY CustomerID;
	
	
--SELECT
--	CustomerID,
--	SUM(SubTotal) Sum2013,
--	MAX(OrderDate) [LastOrder]
--FROM Sales.SalesOrderHeader
--WHERE OrderDate >= '2013-01-01' AND
--	OrderDate <  '2014-01-01' AND
--	CustomerID = 29913
--GROUP BY CustomerID;