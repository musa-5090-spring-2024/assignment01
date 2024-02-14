/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here
SELECT
ROUND(AVG(distance)/1000) AS avg_distance_km
FROM(
    SELECT 
    ROUND((ST_Distance(
        ST_SetSRID(geometry, 4326)::geography,
        ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::geography
    ) / 50)) * 50 AS distance
    FROM 
    indego.station_statuses)
    AS distance_table