# WideWorldImporters — SQL Server Reporting Project

**Status:** In Progress
**Started:** August 2026

## Overview

A hands-on project using Microsoft's WideWorldImporters sample database (a realistic
wholesale/retail OLTP database) to practice and demonstrate:

- T-SQL query writing (joins, aggregations, subqueries, window functions)
- SQL Server performance fundamentals (indexing, execution plans)
- SSRS paginated report development
- Power BI dashboard development

Built to close a specific skills gap for retail/BI-focused Software Engineer roles that
require T-SQL, SSRS, and Power BI alongside general SQL Server experience.

## Why WideWorldImporters

WideWorldImporters is Microsoft's modern sample database (replacing AdventureWorks since
SQL Server 2016), modeling a wholesale distributor — customers, orders, warehouses,
stock items, invoicing. It's built specifically to showcase realistic, current SQL
Server capability, not a toy schema.

## Project Phases

1. **Schema exploration** — understand relationships across the `Sales`, `Warehouse`,
   `Purchasing`, and `Application` schemas
2. **T-SQL practice** — analytical queries: revenue by customer/region/month, top
   products, order fulfillment timelines, stored procedures
3. **Performance & indexing** — add indexes, read execution plans, document before/after
   query performance
4. **SSRS report** — a paginated report (e.g. store/customer sales summary)
5. **Power BI dashboard** — a published dashboard connected to the live database

## Setup

1. Install SQL Server Developer Edition (free) and SSMS
2. Download `WideWorldImporters-Full.bak` from
   [microsoft/sql-server-samples](https://github.com/microsoft/sql-server-samples/releases)
3. Restore in SSMS: right-click Databases → Restore Database → Device → select the `.bak` file
4. Verify: `SELECT TOP 10 * FROM Sales.Orders;`

## Structure

```
/sql
  01_schema_exploration.sql   -- initial queries to understand the schema
  02_analytical_queries.sql   -- revenue, top products, fulfillment analysis
  03_indexing_performance.sql -- index additions + before/after notes
/docs
  notes.md                    -- running log of what was learned / built
```

## Tech Stack

SQL Server, T-SQL, SSMS, SSRS, Power BI
