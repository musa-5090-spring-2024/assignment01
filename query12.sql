/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here
-- ALTER TABLE indego.station_statuses
--     ADD COLUMN iswithin boolean;

SELECT 
    COUNT(*) AS num_stations
FROM indego.station_statuses
WHERE
    ST_DWITHIN(
        geom_32129,
        ST_TRANSFORM(
            ST_SETSRID(
                ST_MAKEPOINT(-75.192584, 39.952415),
                4326
            ),
            32129
        ),
        1000
    ) = TRUE;
