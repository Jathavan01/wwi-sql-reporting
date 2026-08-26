/* =====================================================================
   01_schema_exploration.sql
   Purpose: Get familiar with the WideWorldImporters schema before
   writing analytical queries. Run these one at a time in SSMS.
   ===================================================================== */

-- List all user tables grouped by schema
SELECT s.name AS schema_name, t.name AS table_name
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
ORDER BY s.name, t.name;

-- Row counts per table (quick sense of which tables carry the real data)
SELECT
    s.name AS schema_name,
    t.name AS table_name,
    SUM(p.rows) AS row_count
FROM sys.tables t
JOIN sys.schemas s ON t.schema_id = s.schema_id
JOIN sys.partitions p ON t.object_id = p.object_id AND p.index_id IN (0, 1)
GROUP BY s.name, t.name
ORDER BY row_count DESC;

-- Quick look at core sales tables
SELECT TOP 10 * FROM Sales.Orders;
SELECT TOP 10 * FROM Sales.OrderLines;
SELECT TOP 10 * FROM Sales.Invoices;
SELECT TOP 10 * FROM Sales.Customers;

-- Foreign key relationships involving Sales.Orders (understand how it connects)
SELECT
    fk.name AS fk_name,
    OBJECT_NAME(fk.parent_object_id) AS parent_table,
    OBJECT_NAME(fk.referenced_object_id) AS referenced_table
FROM sys.foreign_keys fk
WHERE OBJECT_NAME(fk.parent_object_id) = 'Orders'
   OR OBJECT_NAME(fk.referenced_object_id) = 'Orders';

-- Warehouse / stock side
SELECT TOP 10 * FROM Warehouse.StockItems;
SELECT TOP 10 * FROM Warehouse.StockItemHoldings;
