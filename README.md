# Databricks SQL in Action — Airline Lab (Unity Catalog)

A GitHub-ready project that reproduces the Databricks SQL lab end‑to‑end using Unity Catalog: catalog & schema setup, managed Volume for CSVs, Bronze streaming tables, Silver materialized views, and example analytics queries.

## Contents
- `sql/01_catalog_schema.sql` — create catalog & schema
- `sql/02_volume_and_copy.sql` — create Volume, load CSVs via `COPY INTO`
- `sql/03_bronze_streaming.sql` — create Bronze `STREAMING TABLE`s from Volume paths
- `sql/04_silver_materialized_views.sql` — create Silver materialized views (+ Gold agg example)
- `sql/05_queries_examples.sql` — alert/AI/BI-friendly queries and examples
- `docs/setup.md` — quick start (upload CSVs, run in order)
- `docs/dashboards.md` — optional AI/BI dashboard steps
- `.github/workflows/sql-format.yml` — basic SQL lint/format (placeholder)

## Quick Start

1. **Prereqs**: Unity Catalog enabled, a SQL Warehouse you can use.
2. **Create the target DB** (catalog+schema) and **Volume** by running files in order from `sql/01_*` then `sql/02_*`.
3. **Upload CSVs** to the Volume (UI → *Catalog Explorer* → your catalog → schema → `raw_airline_files` → *Upload*):
   - `airports/airports.csv`
   - `flights/flights.csv`
   - `lookupcodes/lookupcodes.csv`
4. **Ingest** tables with `COPY INTO` (run `sql/02_*`).
5. **Create Bronze streaming tables** (run `sql/03_*`).  
6. **Create Silver materialized views (+ Gold)** (run `sql/04_*`).  
7. **Run example queries** (run `sql/05_*`).

> Replace the sample catalog `dbsql_samuel` and schema `demo` if you need different names.

## Data Paths (Unity Catalog Volumes)

All file reads use the required UC pattern:

```
/Volumes/<catalog>/<schema>/<volume>/<folder>/<file>
```

Example used here:
```
/Volumes/dbsql_samuel/demo/raw_airline_files/airports/airports.csv
```

## Notes
- For reliability on teaching warehouses, we prefer `COPY INTO` and `read_files(...)` over `USING CSV OPTIONS(path ...)`.
- Materialized views **cannot** define column lists or constraints; PK/FK are shown on tables if needed.
- Some environments reset the current catalog/schema — fully‑qualify objects or precede blocks with `USE CATALOG/SCHEMA`.

## License
MIT
