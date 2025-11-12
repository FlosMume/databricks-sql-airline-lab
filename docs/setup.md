# Setup & Execution

## 0) Choose your catalog & schema
Edit the files to change `dbsql_samuel` / `demo` if needed.

## 1) Run in order
1. `sql/01_catalog_schema.sql`
2. `sql/02_volume_and_copy.sql`
3. `sql/03_bronze_streaming.sql`
4. `sql/04_silver_materialized_views.sql`
5. `sql/05_queries_examples.sql`

## 2) Upload CSVs into the Volume
UI → Catalog Explorer → **dbsql_samuel** → **demo** → **raw_airline_files** → *Upload*
- airports/airports.csv
- flights/flights.csv
- lookupcodes/lookupcodes.csv

## 3) Verify
```sql
SHOW TABLES IN dbsql_samuel.demo;
SELECT COUNT(*) FROM dbsql_samuel.demo.airports;
SELECT COUNT(*) FROM dbsql_samuel.demo.flights;
SELECT COUNT(*) FROM dbsql_samuel.demo.lookupcodes;
```
