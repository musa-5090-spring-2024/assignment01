-- Active: 1708533339248@@127.0.0.1@5432@assignment01
/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here
SELECT AVG(distance) AS average_distance_km
FROM (
    SELECT
        name,
        the_geog AS station_geog,
        ROUND(
            ST_Distance(
                the_geog,
                ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)
            )::numeric / 1000
        ) * 1000 AS distance
    FROM
        indego.stations
) AS subquery;