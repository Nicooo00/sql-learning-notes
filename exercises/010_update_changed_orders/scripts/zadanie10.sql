USE AdventureWorksETL


USE AdventureWorksETL;
GO

UPDATE oh
SET oh.SubTotal = ohb.SubTotal
FROM stg.SalesOrderHeader AS oh
INNER JOIN stg.SalesOrderHeaderBatch AS ohb
    ON oh.SalesOrderID = ohb.SalesOrderID
WHERE oh.SubTotal <> ohb.SubTotal;

SELECT @@ROWCOUNT AS UpdatedRows;

--skrypt rozwiazujacy polecenie zadania


