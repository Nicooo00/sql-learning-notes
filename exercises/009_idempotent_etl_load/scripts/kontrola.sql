USE AdventureWorksETL

DELETE FROM stg.SalesOrderHeader
WHERE SalesOrderID IN (49181,49182,49183)


SELECT
oh.*
FROM AdventureWorks2022.Sales.SalesOrderHeader oh
LEFT JOIN stg.SalesOrderHeader Eoh
ON oh.SalesOrderID = Eoh.SalesOrderID
WHERE oh.SalesOrderID IN (49181,49182,49183) AND
    oh.OrderDate >= '2013-01-01' 
    AND   oh.OrderDate < '2014-01-01'
    AND Eoh.SalesOrderID IS NULL;

--powinno zwrocic pusta tabele jesli wszystko pojdzie dobrze

SELECT
    CASE 
        WHEN (SELECT COUNT(*) FROM stg.SalesOrderHeader) = 
        (SELECT COUNT(*) FROM AdventureWorks2022.Sales.SalesOrderHeader
        WHERE OrderDate >= '2013-01-01' 
        AND   OrderDate < '2014-01-01')
        THEN 0
        ELSE 1
    END [OrderQuantityCheck],
    CASE 
        WHEN (SELECT SUM(SubTotal) FROM stg.SalesOrderHeader) = 
        (SELECT SUM(SubTotal) FROM AdventureWorks2022.Sales.SalesOrderHeader
        WHERE OrderDate >= '2013-01-01' 
        AND   OrderDate < '2014-01-01')
        THEN 0
        ELSE 1
    END [SubTotalCheck];

-- powinno zwrocic 2 flagi z wartscia 0

