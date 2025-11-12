-- 02_volume_and_copy.sql
USE CATALOG dbsql_samuel;
USE SCHEMA demo;

-- Create a UC Volume to host CSVs
CREATE VOLUME IF NOT EXISTS raw_airline_files
  COMMENT 'Local uploads: airports, flights, lookupcodes';

-- Managed tables + COPY INTO (robust on teaching warehouses)

-- Airports
CREATE TABLE IF NOT EXISTS dbsql_samuel.demo.airports (
  IATA STRING, Airport STRING, City STRING, State STRING, Country STRING,
  Latitude DOUBLE, Longitude DOUBLE
);

COPY INTO dbsql_samuel.demo.airports
FROM '/Volumes/dbsql_samuel/demo/raw_airline_files/airports/airports.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true');

-- Flights
CREATE TABLE IF NOT EXISTS dbsql_samuel.demo.flights (
  FlightNum STRING,
  Origin STRING,
  Dest STRING,
  Year INT,
  Month INT,
  DayofWeek INT,
  Date DATE,
  UniqueCarrier STRING,
  TailNum STRING,
  DepTime STRING,
  ArrTime STRING,
  ActualElapsedTime DOUBLE,
  Distance DOUBLE,
  IsArrDelayed STRING,
  IsDepDelayed STRING
);

COPY INTO dbsql_samuel.demo.flights
FROM '/Volumes/dbsql_samuel/demo/raw_airline_files/flights/flights.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true');

-- Lookup Codes
CREATE TABLE IF NOT EXISTS dbsql_samuel.demo.lookupcodes (
  UniqueCode STRING,
  Description STRING
);

COPY INTO dbsql_samuel.demo.lookupcodes
FROM '/Volumes/dbsql_samuel/demo/raw_airline_files/lookupcodes/lookupcodes.csv'
FILEFORMAT = CSV
FORMAT_OPTIONS ('header'='true');

-- Verifications
SELECT COUNT(*) AS airports_rows FROM dbsql_samuel.demo.airports;
SELECT COUNT(*) AS flights_rows  FROM dbsql_samuel.demo.flights;
SELECT COUNT(*) AS codes_rows    FROM dbsql_samuel.demo.lookupcodes;
