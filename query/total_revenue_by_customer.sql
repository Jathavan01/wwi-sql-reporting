SELECT
    c.CustomerName,
    SUM(il.ExtendedPrice) AS TotalRevenue
FROM Sales.Invoices i
JOIN Sales.InvoiceLines il ON i.InvoiceID = il.InvoiceID
JOIN Sales.Customers c ON i.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalRevenue DESC;