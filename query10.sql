/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

-- Enter your SQL query here

-- ALTER TABLE indego.station_statuses
-- ADD COLUMN geom_32129 geometry;

-- UPDATE indego.station_statuses SET
--     geom_32129 = st_transform(the_geog::geometry, 32129);

SELECT
    id AS station_id,
    the_geog AS station_geog,
    ROUND(ST_DISTANCE(
        ST_TRANSFORM(the_geog::geometry, 32129),
        ST_TRANSFORM(
            ST_SETSRID(
                ST_MAKEPOINT(-75.192584, 39.952415),
                4326
            ),
            32129
        )
    ) / 50) * 50 AS distance
FROM indego.station_statuses;
