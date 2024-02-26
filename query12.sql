/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here

SELECT -- noqa: LT09
    COUNT(*) AS num_stations
FROM (
    SELECT
        ST_DISTANCE(
            ST_SETSRID(ST_MAKEPOINT(longitude, latitude), 4326),
            ST_SETSRID(ST_MAKEPOINT(-75.192584, 39.952415), 4326)
        ) AS distance
    FROM
        indego_station_statuses
) AS distances
WHERE
    distance <= 1000;
