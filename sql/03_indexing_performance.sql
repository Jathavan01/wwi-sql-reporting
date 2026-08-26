/* =====================================================================
   03_indexing_performance.sql
   Purpose: Document indexing decisions and before/after performance.
   Fill this in as you go -- take note of actual execution time /
   execution plan differences, not just the index-creation statements.
   ===================================================================== */

-- STEP 1: Run a query from 02_analytical_queries.sql with
-- "Include Actual Execution Plan" turned on in SSMS (Ctrl+M).
-- Note the plan here before adding any index.

-- Example baseline check: enable statistics to see logical reads / CPU time
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

-- Run your target query here, e.g.:
-- SELECT c.CustomerName, SUM(il.ExtendedPrice) AS TotalRevenue
-- FROM Sales.Invoices i
-- JOIN Sales.InvoiceLines il ON i.InvoiceID = il.InvoiceID
-- JOIN Sales.Customers c ON i.CustomerID = c.CustomerID
-- GROUP BY c.CustomerName
-- ORDER BY TotalRevenue DESC;

-- STEP 2: Add a targeted index based on what the execution plan flags
-- (e.g. a missing index suggestion, or a scan where a seek should be possible)
-- Example:
-- CREATE NONCLUSTERED INDEX IX_InvoiceLines_StockItemID
-- ON Sales.InvoiceLines (StockItemID) INCLUDE (ExtendedPrice, Quantity);

-- STEP 3: Re-run the same query, compare logical reads / elapsed time / plan shape.
-- Document the before/after numbers in docs/notes.md, not just here --
-- the notes file is what you'll actually reference in an interview.

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
