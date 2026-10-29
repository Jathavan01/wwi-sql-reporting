CREATE NONCLUSTERED INDEX IX_InvoiceLines_StockItemID
ON Sales.InvoiceLines (StockItemID) INCLUDE (ExtendedPrice);