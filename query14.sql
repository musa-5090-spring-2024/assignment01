/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here

SELECT
  id AS station_id,
  name AS station_name,
  ROUND(ST_Distance(ST_SetSRID(ST_MakePoint(coordinates[1], coordinates[2]), 4326)::geography, ST_MakePoint(-75.192584, 39.952415)::geography)/50)*50 AS distance
  FROM 
  indego.indego_station_statuses
ORDER BY
  distance ASC
LIMIT 1;
