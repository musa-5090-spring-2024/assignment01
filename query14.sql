/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here
SELECT
    id as station_id,
    name as station_name,
    round(
        ST_Distance(
            geog, ST_setsrid(
                ST_MakePoint(-75.192584, 39.952415), 4326)::geography)/ 50) * 50
                AS distance
from indego.station_statuses
ORDER BY
  distance 
LIMIT 1;