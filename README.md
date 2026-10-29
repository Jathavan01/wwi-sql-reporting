# WideWorldImporters: SQL Server Reporting Project

**Status:** Core phases complete | **Started:** August 2026

## Overview

A hands-on project using Microsoft's WideWorldImporters sample database (a realistic wholesale/retail OLTP database) to practice and demonstrate:

- T-SQL query writing (joins, aggregations, subqueries, window functions)
- SQL Server performance fundamentals (indexing, execution plans)
- SSRS paginated report development
- Power BI dashboard development

Built to close a specific skills gap for retail and BI-focused software engineering roles that require T-SQL, SSRS, and Power BI alongside general SQL Server experience.

## Why WideWorldImporters

WideWorldImporters is Microsoft's modern sample database (replacing AdventureWorks since SQL Server 2016), modeling a wholesale distributor: customers, orders, warehouses, stock items, and invoicing. It is built to showcase realistic, current SQL Server capability, not a toy schema.

## Project Phases

1. **Schema exploration:** understand relationships across the `Sales`, `Warehouse`, `Purchasing`, and `Application` schemas
2. **T-SQL practice:** analytical queries such as revenue by customer, region, and month, top products, and order fulfillment timelines
3. **Performance and indexing:** add indexes, read execution plans, and document before/after query performance
4. **SSRS report:** a paginated report of top customers by revenue, built in Microsoft Report Builder
5. **Power BI dashboard:** a revenue dashboard (.pbix) built in Power BI Desktop and connected to the local database

## Setup

1. Install SQL Server Developer Edition (free) and SSMS
2. Download `WideWorldImporters-Full.bak` from [microsoft/sql-server-samples](https://github.com/microsoft/sql-server-samples)
3. Restore in SSMS: right-click Databases, choose Restore Database, select Device, and pick the `.bak` file
4. Verify: `SELECT TOP 10 * FROM Sales.Orders;`

## Structure

```
sql/
  01_schema_exploration.sql     initial queries to understand the schema
  02_analytical_queries.sql     revenue, top products, fulfillment analysis
  03_indexing_performance.sql   index additions with before/after notes
query/
  individual working queries (revenue trends, running totals, order fulfillment,
  index creation, and before/after performance checks)  
powerbi/
  wwi-revenue-dashboard.pbix    Power BI dashboard
ssrs/
  TopCustomersByRevenue.rdl     SSRS paginated report
```

## Tech Stack

SQL Server, T-SQL, SSMS, SSRS (Report Builder), Power BI

## Planned

- SSIS package work using Microsoft's WideWorldImporters sample package
- Optionally SSAS