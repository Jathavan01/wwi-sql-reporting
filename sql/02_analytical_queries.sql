/* =====================================================================
   02_analytical_queries.sql
   Purpose: Analytical queries that mirror what SSRS/Power BI reports
   will be built on top of. This is where joins, aggregation, and
   window functions get practiced.
   ===================================================================== */

-- Revenue by customer, descending
SELECT
    c.CustomerName,
    SUM(il.ExtendedPrice) AS TotalRevenue
FROM Sales.Invoices i
JOIN Sales.InvoiceLines il ON i.InvoiceID = il.InvoiceID
JOIN Sales.Customers c ON i.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalRevenue DESC;

-- Monthly revenue trend
SELECT
    FORMAT(i.InvoiceDate, 'yyyy-MM') AS InvoiceMonth,
    SUM(il.ExtendedPrice) AS TotalRevenue
FROM Sales.Invoices i
JOIN Sales.InvoiceLines il ON i.InvoiceID = il.InvoiceID
GROUP BY FORMAT(i.InvoiceDate, 'yyyy-MM')
ORDER BY InvoiceMonth;

-- Top 10 stock items by revenue
SELECT TOP 10
    si.StockItemName,
    SUM(il.ExtendedPrice) AS TotalRevenue,
    SUM(il.Quantity) AS TotalUnitsSold
FROM Sales.InvoiceLines il
JOIN Warehouse.StockItems si ON il.StockItemID = si.StockItemID
GROUP BY si.StockItemName
ORDER BY TotalRevenue DESC;

-- Order fulfillment: days between order date and picking completed date
SELECT
    o.OrderID,
    o.OrderDate,
    o.PickingCompletedWhen,
    DATEDIFF(day, o.OrderDate, o.PickingCompletedWhen) AS DaysToFulfill
FROM Sales.Orders o
WHERE o.PickingCompletedWhen IS NOT NULL
ORDER BY DaysToFulfill DESC;

-- Running total of revenue by month (window function practice)
SELECT
    InvoiceMonth,
    TotalRevenue,
    SUM(TotalRevenue) OVER (ORDER BY InvoiceMonth) AS RunningTotal
FROM (
    SELECT
        FORMAT(i.InvoiceDate, 'yyyy-MM') AS InvoiceMonth,
        SUM(il.ExtendedPrice) AS TotalRevenue
    FROM Sales.Invoices i
    JOIN Sales.InvoiceLines il ON i.InvoiceID = il.InvoiceID
    GROUP BY FORMAT(i.InvoiceDate, 'yyyy-MM')
) monthly
ORDER BY InvoiceMonth;
