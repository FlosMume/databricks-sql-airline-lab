-- ATL delay alert
CREATE ALERT IF NOT EXISTS atl_flight_delay_alert
AS
SELECT COUNT(*) AS delayed_flights
FROM dbsql_samuel.demo.flights_silver_mv
WHERE Dest='ATL' AND IsArrDelayed='YES'
HAVING delayed_flights > 100;

-- Permissions example
GRANT SELECT ON TABLE dbsql_samuel.demo.flights_silver_mv TO `data_analyst`;
