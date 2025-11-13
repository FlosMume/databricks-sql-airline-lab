# Flight Dashboard Instructions (Databricks SQL + AI/BI)

This guide walks you through building the Flight Data Dashboard used in the Databricks SQL in Action lab.

---

## 1. Add Datasets to the Dashboard

Open **Dashboards → Create Dashboard**.

Add the following datasets:
- `dbsql_samuel.demo.flights_silver_mv`
- `dbsql_samuel.demo.airports_silver_mv`
- `dbsql_samuel.demo.lookupcodes_silver_mv`
- `dbsql_samuel.demo.airports_by_city_mv`

---

## 2. Create Monthly Delays Visualization

Run this SQL in SQL Editor and save it as a Dataset:

```sql
SELECT
  YEAR(FlightDate) AS year,
  MONTH(FlightDate) AS month,
  COUNT(*) AS delayed_flights
FROM dbsql_samuel.demo.flights_silver_mv
WHERE IsArrDelayed = 'YES'
GROUP BY 1,2
ORDER BY 1,2;
```

In dashboard:
- Add → Visualization  
- Select **Bar Chart**  
- X = `month`  
- Group = `year`  
- Y = `delayed_flights`

---

## 3. AI Assistant Visualization

Use the “Ask AI” panel:
```
Show me the number of delayed flights per destination.
```

Save the generated query as a dataset and add to dashboard.

---

## 4. Add Filters

### Destination Airport  
- Create filter: *Dropdown*  
- Bind to: `flights_silver_mv.Dest`

### Year Filter  
- Create filter: *Slider*  
- Bind to: `year` in monthly delays dataset

---

## 5. Suggested Layout
- Top-left: Monthly delays  
- Top-right: AI-generated delays by airport  
- Bottom-left: Airports per city  
- Bottom-right: Lookup codes viewer  

---

## 6. Sharing

Click **Share → Public Link** or assign to Unity Catalog groups.

