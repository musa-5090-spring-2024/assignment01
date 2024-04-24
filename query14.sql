/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here
SELECT
    name AS station_id,
    ST_Distance(
        ST_GeographyFromText('POINT(-75.192584 39.952415)'),
        ST_GeographyFromText('POINT(' || longitude || ' ' || latitude || ')')
    ) AS distance,
    longitude || ',' || latitude AS station_geog
FROM
    indego.station_statuses
ORDER BY
    distance ASC
LIMIT 1;