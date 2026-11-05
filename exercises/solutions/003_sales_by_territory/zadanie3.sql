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