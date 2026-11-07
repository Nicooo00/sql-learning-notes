USE AdventureWorksETL

UPDATE oh
SET oh.SubTotal = Aoh.SubTotal
FROM stg.SalesOrderHeader oh
INNER JOIN AdventureWorks2022.Sales.SalesOrderHeader Aoh
    ON oh.SalesOrderID = Aoh.SalesOrderID
WHERE oh.SubTotal <> Aoh.SubTotal AND
oh.SalesOrderID IN (51131,55282,51822);

SELECT @@ROWCOUNT AS UpdatedRows;
-- skrypt do cofniecia dzialania skryptu z zadania