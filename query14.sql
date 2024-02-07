/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here
WITH nearest_station AS (
   SELECT
       id AS station_id,
	   name AS station_name,
       geog AS station_geog,
       ROUND(ST_Distance(
           ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::geography,
           geog, true) / 50) * 50 AS distance
   FROM indego.indego_station_statuses
)

SELECT
    station_id,
    station_name,
    distance
FROM nearest_station
WHERE distance = (SELECT MIN(distance) FROM nearest_station);

-- Result:
-- station_id = 3208
-- station_name = 34TH & Spruce
-- distance = 200m