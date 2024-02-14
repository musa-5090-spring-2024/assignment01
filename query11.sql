/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here
SELECT
ROUND(AVG(st_distance(ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::geography, ST_SetSRID(st_makepoint(-75.192584,39.952415),4326)::geography))/1000) AS avg_distance_km
FROM
indego_station_statuses


