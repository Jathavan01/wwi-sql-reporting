SET STATISTICS IO ON;

SELECT
    il.InvoiceLineID,
    il.StockItemID,
    il.Quantity,
    il.ExtendedPrice
FROM Sales.InvoiceLines il
WHERE il.StockItemID = 100;

SET STATISTICS IO OFF;