-- Active: 1707946829593@@127.0.0.1@5432@assignment01
/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

SELECT
    name,
    the_geog AS station_geog,
    ROUND(
        ST_Distance(
            the_geog,
            ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)
        )::numeric / 50
    ) * 50 AS distance
FROM
    indego.stations;
