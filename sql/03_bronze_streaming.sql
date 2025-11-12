-- 03_bronze_streaming.sql
USE CATALOG dbsql_samuel;
USE SCHEMA demo;

-- Bronze streaming tables
CREATE OR REFRESH STREAMING TABLE dbsql_samuel.demo.airports_bronze_st AS
SELECT * FROM STREAM read_files('/Volumes/dbsql_samuel/demo/raw_airline_files/airports');

CREATE OR REFRESH STREAMING TABLE dbsql_samuel.demo.flights_bronze_st AS
SELECT * FROM STREAM read_files('/Volumes/dbsql_samuel/demo/raw_airline_files/flights');

CREATE OR REFRESH STREAMING TABLE dbsql_samuel.demo.lookupcodes_bronze_st AS
SELECT * FROM STREAM read_files('/Volumes/dbsql_samuel/demo/raw_airline_files/lookupcodes');
