--Zadanie5

WITH [CTE_zad5_1] AS
(
	SELECT
		CustomerID,
		Count(*) OrderCount,
		SUM(SubTotal) TotalSubTotal2012,
		MAX(OrderDate) AS LastOrderDate
	FROM Sales.SalesOrderHeader
	WHERE OrderDate >= '2012-01-01' AND
		  OrderDate < '2013-01-01'
	GROUP BY CustomerID
), [CTE_zad5_2] AS
(
	SELECT
		CustomerID,
		Count(*) [OrderCount]
	FROM Sales.SalesOrderHeader
	WHERE OrderDate >= '2013-01-01'
	   AND OrderDate < '2014-01-01'
	GROUP BY CustomerID
	HAVING Count(*) > 0
)

SELECT
	cte1.CustomerID,
	cte1.OrderCount,
	cte1.TotalSubTotal2012,
	cte1.LastOrderDate
FROM CTE_zad5_1 cte1
LEFT JOIN CTE_zad5_2 cte2 ON
cte1.CustomerID = cte2.CustomerID
WHERE cte2.CustomerID IS NULL
ORDER BY
	cte1.TotalSubTotal2012 DESC,
	cte1.CustomerID ASC;


SELECT
	Count(*) OrderCount,
	SUM(SubTotal) TotalSubTotal2012,
	MAX(OrderDate) AS LastOrderDate
FROM Sales.SalesOrderHeader
	WHERE CustomerID = 15320 AND
	OrderDate >= '2012-01-01'
		AND OrderDate < '2013-01-01';

SELECT
	Count(*) OrderCount,
	SUM(SubTotal) TotalSubTotal2012,
	MAX(OrderDate) AS LastOrderDate
FROM Sales.SalesOrderHeader
	WHERE CustomerID = 15320 AND
	OrderDate >= '2013-01-01'
		AND OrderDate < '2014-01-01';	  