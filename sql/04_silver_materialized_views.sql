-- 04_silver_materialized_views.sql
USE CATALOG dbsql_samuel;
USE SCHEMA demo;

-- Silver MVs
CREATE OR REPLACE MATERIALIZED VIEW dbsql_samuel.demo.airports_silver_mv AS
SELECT IATA, City, State
FROM dbsql_samuel.demo.airports_bronze_st;

CREATE OR REPLACE MATERIALIZED VIEW dbsql_samuel.demo.lookupcodes_silver_mv AS
SELECT UniqueCode, Description
FROM dbsql_samuel.demo.lookupcodes_bronze_st
WHERE UniqueCode IS NOT NULL AND Description IS NOT NULL;

CREATE OR REPLACE MATERIALIZED VIEW dbsql_samuel.demo.flights_silver_mv AS
SELECT
  FlightNum,
  Origin,
  Dest,
  Year,
  Month,
  DayofWeek,
  `Date` AS FlightDate,
  UniqueCarrier,
  TailNum,
  DepTime,
  ArrTime,
  ActualElapsedTime,
  Distance,
  IsArrDelayed,
  IsDepDelayed
FROM dbsql_samuel.demo.flights_bronze_st
WHERE FlightNum IS NOT NULL;

-- Gold MV example
CREATE OR REPLACE MATERIALIZED VIEW dbsql_samuel.demo.airports_by_city_mv AS
SELECT City, COUNT(*) AS number_of_airports
FROM dbsql_samuel.demo.airports_silver_mv
GROUP BY City;
