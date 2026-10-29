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