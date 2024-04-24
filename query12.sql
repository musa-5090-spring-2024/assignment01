/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here
SELECT
    COUNT(*) AS num_stations
FROM
    indego.station_statuses
WHERE
    ST_Distance(
        ST_GeographyFromText('POINT(-75.192584 39.952415)'),
        ST_GeographyFromText('POINT(' || longitude || ' ' || latitude || ')')
    ) <= 1000;
