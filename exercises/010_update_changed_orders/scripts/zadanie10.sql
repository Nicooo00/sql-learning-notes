USE AdventureWorksETL


USE AdventureWorksETL;
GO

UPDATE oh
SET oh.SubTotal = ohb.SubTotal
FROM stg.SalesOrderHeader AS oh
INNER JOIN stg.SalesOrderHeaderBatch AS ohb
    ON oh.SalesOrderID = ohb.SalesOrderID
WHERE oh.SubTotal <> ohb.SubTotal;
--skrypt rozwiazujacy polecenie zadania

-------------------------------------------------------------------

UPDATE oh
SET oh.SubTotal = Aoh.SubTotal
FROM stg.SalesOrderHeader oh
INNER JOIN AdventureWorks2022.Sales.SalesOrderHeader Aoh
ON oh.SalesOrderID = Aoh.SalesOrderID
WHERE oh.SubTotal <> Aoh.SubTotal;
-- skrypt do cofniecia dzialania skryptu z zadania