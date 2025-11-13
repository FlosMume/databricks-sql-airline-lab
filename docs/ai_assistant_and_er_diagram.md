# AI Assistant & ER Diagram Generation

Databricks AI Assistant helps with:
1. Auto-generating SQL  
2. Documenting datasets  
3. Explaining columns and relationships  
4. Creating ER diagrams for schemas  

---

## 1. AI Assistant for SQL

### Examples:
```
Explain the structure of flights_silver_mv.
```
```
Write a query showing top 10 busiest airports.
```
```
Generate SQL for delays grouped by airline and month.
```

Assistant outputs runnable SQL directly to the editor.

---

## 2. Auto-Documentation with AI

Open:
```
Catalog Explorer → Table → AI Describe
```

AI generates:
- Summary of the table  
- Column definitions  
- Typical use cases  
- Suggested joins  
- Quality notes (if available)  

---

## 3. Generate an ER Diagram

Steps:
1. Open **Catalog Explorer**  
2. Select:
   ```
   dbsql_samuel.demo
   ```
3. Click **Relationships → View Diagram**  
4. The ER diagram shows:
   - Tables  
   - MVs  
   - Joins (inferred by matching column names)  
   - Upstream/downstream lineage  

Export the diagram as **PNG** for your GitHub repo.

---

## 4. Adding ER Diagram to GitHub

Place exported file under:
```
docs/er_diagram.png
```

Add a short description in the README:
- Bronze → Silver → Gold flow  
- Lookup relationships (UniqueCarrier ↔ UniqueCode)  
- Airport geography relationships  

---

## 5. Resume / GitHub Highlights

You may state:
- “Implemented AI-assisted SQL dataset documentation.”  
- “Generated ER diagrams with Unity Catalog lineage integration.”  
- “Developed analytics workflow using AI-assisted Databricks SQL.”  

