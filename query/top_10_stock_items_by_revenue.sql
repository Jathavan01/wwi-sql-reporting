SELECT TOP 10
    si.StockItemName,
    SUM(il.ExtendedPrice) AS TotalRevenue,
    SUM(il.Quantity) AS TotalUnitsSold
FROM Sales.InvoiceLines il
JOIN Warehouse.StockItems si ON il.StockItemID = si.StockItemID
GROUP BY si.StockItemName
ORDER BY TotalRevenue DESC;