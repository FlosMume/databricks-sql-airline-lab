-- 05_queries_examples.sql
USE CATALOG dbsql_samuel;
USE SCHEMA demo;

-- Sample lookups
SELECT * FROM dbsql_samuel.demo.lookupcodes_silver_mv LIMIT 10;

-- Monthly delayed arrivals for a destination (uses FlightDate)
SELECT
  YEAR(FlightDate) AS year,
  MONTH(FlightDate) AS month,
  COUNT(*) AS delayed_flights
FROM dbsql_samuel.demo.flights_silver_mv
WHERE Dest = 'ATL' AND IsArrDelayed = 'YES'
GROUP BY YEAR(FlightDate), MONTH(FlightDate)
ORDER BY year, month;

-- Example AI classify (requires enabled model & permissions)
-- SELECT IATA,
--   ai_classify(
--     content => IATA,
--     labels => array('full service carriers','low cost carriers','regional airlines','charter airlines')
--   ) AS airline_category
-- FROM dbsql_samuel.demo.airports
-- LIMIT 10;
