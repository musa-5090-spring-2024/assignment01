/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

SELECT
    COUNT(*) AS num_stations
FROM
    (
        SELECT
            name,
            the_geog AS station_geog
        FROM
            indego.stations
        WHERE
            ST_DWithin(
                the_geog,
                ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326),
                1000
            )
    ) AS subquery;

