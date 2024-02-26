/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here

SELECT COUNT(*) AS num_stations
FROM (
  SELECT
    DISTINCT ON (coordinates)
    coordinates[2] AS start_lat,
    coordinates[1] AS start_lon
  FROM
    indego.indego_station_statuses
  WHERE
    ST_Distance(ST_SetSRID(ST_MakePoint(coordinates[1], coordinates[2]), 4326)::geography, ST_MakePoint(-75.192584, 39.952415)::geography) <= 1000
) AS unique_stations
