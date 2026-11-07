USE AdventureWorksETL

CREATE TABLE [stg].[SalesOrderHeaderBatch] (
    SalesOrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    SubTotal MONEY NOT NULL

    Constraint pk_HeaderBatch PRIMARY KEY(SalesOrderID)
);
-- przygotowanie tabeli

INSERT INTO stg.SalesOrderHeaderBatch
(
    SalesOrderID,
    CustomerID,
    OrderDate,
    SubTotal
)
SELECT
    SalesOrderID,
    CustomerID,
    OrderDate,
    SubTotal
FROM AdventureWorks2022.Sales.SalesOrderHeader
WHERE SalesOrderID IN(51131,55282,51822);
-- insert 3 wybranych zamowien

UPDATE stg.SalesOrderHeaderBatch
SET SubTotal = SubTotal + 10
WHERE SalesOrderID = 51131;
-- powiekszenie zamowienia 51131 o 10.00


UPDATE stg.SalesOrderHeaderBatch
SET SubTotal = SubTotal + 20
WHERE SalesOrderID = 55282;
-- powiekszenie zamowienia 55282 o 20.00



