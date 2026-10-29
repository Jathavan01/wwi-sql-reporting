SELECT
    o.OrderID,
    o.OrderDate,
    o.PickingCompletedWhen,
    DATEDIFF(day, o.OrderDate, o.PickingCompletedWhen) AS DaysToFulfill
FROM Sales.Orders o
WHERE o.PickingCompletedWhen IS NOT NULL
ORDER BY DaysToFulfill DESC;