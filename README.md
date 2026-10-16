# SQL Query Optimization Using Indexes

## Project objective
Identify query access patterns with `EXPLAIN`, add suitable indexes, compare execution plans, and document measured performance changes.

## Files
- `schema.sql` — optional demo database and sample tables/data.
- `queries_before.sql` — baseline execution plans.
- `indexes.sql` — indexes to create.
- `queries_after.sql` — same plans after indexing.
- `performance_report.md` — report template for real results.

## Requirements
- MySQL 8+ or compatible MariaDB
- MySQL Workbench, phpMyAdmin, or a SQL client

## How to run
1. If SkillPilots provided a database/schema, use that instead of the demo schema and adapt the queries to its real table and column names.
2. Otherwise run `schema.sql`.
3. Run `queries_before.sql` and save the EXPLAIN outputs before creating indexes.
4. Run `indexes.sql`.
5. Run `queries_after.sql`.
6. Compare `type`, `key`, `rows`, and `Extra`; record actual timings if available.
7. Complete `performance_report.md` using actual results.

For MySQL 8.0.18+, `EXPLAIN ANALYZE` can show actual execution information, but it executes the query. Use it only with suitable statements and a test database.

## Important
The sample data is deliberately small to keep setup easy. On small tables, MySQL may still prefer a table scan, even after indexes are created. For a meaningful benchmark, test with a larger representative dataset and repeat measurements. Never claim a specific improvement unless you measured it.

## Suggested GitHub repository description
A MySQL demo project showing how to inspect SQL execution plans, create indexes, and document query performance.
