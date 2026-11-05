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
