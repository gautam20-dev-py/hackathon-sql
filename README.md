# Sample SQL Codebase - Dependency Demo
This sample repository contains a small SQL codebase with base tables and layered views.
It's designed to demonstrate dependency traversal and lineage extraction.

Structure:
- base_tables/: raw table DDLs (customers, orders, order_items, products, payments)
- views/: intermediate views that build on base tables
- marts/: final views / aggregations (dependent on multiple downstream views)

Use this for testing tools that extract dependencies, generate CTEs, or visualize lineage.
