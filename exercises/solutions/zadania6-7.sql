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


USE AdventureWorks2022

--Zadanie7

WITH [CTE_zad7_1] AS
(
	SELECT 
		oh.CustomerID,
		st.TerritoryID,
		COUNT(*) [OrderCount],
		SUM(SubTotal) [TotalSubTotal]
	FROM Sales.SalesOrderHeader oh
	INNER JOIN Sales.SalesTerritory st ON
	oh.TerritoryID = st.TerritoryID
	WHERE OrderDate >= '2013-01-01' AND
		  OrderDate <  '2014-01-01'
	GROUP BY 
		oh.CustomerID,
		st.TerritoryID
)

SELECT
*
FROM 
	(
		SELECT
			cte1.*,
			st.Name [TerritoryName],
			ROW_NUMBER() OVER(PARTITION BY cte1.TerritoryID ORDER BY TotalSubTotal DESC, CustomerID ASC) [TerritoryPosition]
		FROM CTE_zad7_1 cte1
		INNER JOIN Sales.SalesTerritory st ON
		cte1.TerritoryID = st.TerritoryID
	)t
WHERE TerritoryPosition <= 3
ORDER BY
	TerritoryID ASC,
	TerritoryPosition ASC;


--Sprawdzenie

--SELECT
--*
--FROM 
--	(
--		SELECT
--			cte1.*,
--			st.Name [TerritoryName],
--			ROW_NUMBER() OVER(PARTITION BY cte1.TerritoryID ORDER BY TotalSubTotal DESC, CustomerID ASC) [TerritoryPosition]
--		FROM CTE_zad7_1 cte1
--		INNER JOIN Sales.SalesTerritory st ON
--		cte1.TerritoryID = st.TerritoryID
--	)t
--WHERE TerritoryID = 10
--ORDER BY
--	TerritoryID DESC,
--	TerritoryPosition ASC




	
		



