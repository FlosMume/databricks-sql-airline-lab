# Lineage Overview (Unity Catalog)

Unity Catalog automatically tracks **column-level** and **table-level** lineage across SQL queries, streaming tables, materialized views, dashboards, and Lakeflow jobs.

---

## 1. Accessing Lineage

Open:
```
Catalog Explorer → dbsql_samuel → demo → <any table> → Lineage
```

You will see:
- **Upstream** sources (e.g., CSV Volume paths, Bronze tables)  
- **Downstream** dependencies (Silver/Gold MVs, dashboards, alerts)  

---

## 2. Airline Lab Lineage Structure

### Bronze Layer  
Derived from Volume CSVs:
- `airports_bronze_st`  
- `flights_bronze_st`  
- `lookupcodes_bronze_st`  

### Silver Layer  
- `airports_silver_mv` ← airports_bronze_st  
- `lookupcodes_silver_mv` ← lookupcodes_bronze_st  
- `flights_silver_mv` ← flights_bronze_st  

### Gold Layer  
- `airports_by_city_mv` ← airports_silver_mv  

### Dashboards & Alerts  
- Dashboards show as downstream  
- Alerts (e.g. ATL delay alert) show lineage including triggering dataset  

### Lakeflow Jobs  
If run, tasks appear in operational lineage.

---

## 3. Why Lineage Is Useful

- Debug workflow failures  
- Validate dependency chains  
- Ensure governance & compliance  
- Remove unused assets  
- Support documentation & audits  

---

## 4. Notes

- Lineage populates only after first read/write  
- Dashboards create lineage when visualizations query data  
- AI/BI interactions are tracked after execution  

