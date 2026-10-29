SET STATISTICS IO ON;
SET STATISTICS TIME ON;

SELECT
    si.StockItemName,
    SUM(il.ExtendedPrice) AS TotalRevenue
FROM Sales.InvoiceLines il
JOIN Warehouse.StockItems si ON il.StockItemID = si.StockItemID
GROUP BY si.StockItemName
ORDER BY TotalRevenue DESC;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;