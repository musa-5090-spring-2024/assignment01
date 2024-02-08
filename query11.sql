/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here
WITH Avg_distance AS (
   SELECT
       id AS station_id,
       geog AS station_geog,
       ROUND(ST_Distance(
           ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::geography,
           geog, true) / 1000) AS distance
   FROM indego_station_statuses
)

SELECT
    ROUND(AVG(distance)) AS avg_distance_km
FROM Avg_distance;

-- Result: 3km