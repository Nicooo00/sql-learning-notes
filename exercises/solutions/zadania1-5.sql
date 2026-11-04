USE [AdventureWorks2022]

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

--Zadanie 3

SELECT
	st.TerritoryID,
	st.Name TerritoryName,
	COUNT(*) OrderCount,
	SUM(SubTotal) TotalSubTotal,
	AVG(SubTotal) AverageSubTotal
FROM Sales.SalesOrderHeader oh
INNER JOIN Sales.SalesTerritory st ON
oh.TerritoryID = st.TerritoryID
WHERE OrderDate >= '2013-01-01'
   AND OrderDate < '2014-01-01'
GROUP BY st.TerritoryID,
		 st.Name
ORDER BY 
	TotalSubTotal DESC,
	st.TerritoryID ASC

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


	






