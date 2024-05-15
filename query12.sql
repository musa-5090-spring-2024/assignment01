/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

SELECT
    COUNT(*) AS num_stations
FROM
    indego_stations
WHERE
    SQRT(
        POWER((latitude - 39.952415) * 111319, 2) +
        POWER((longitude - (-75.192584)) * 111319 * COS(RADIANS(39.952415)), 2)
    ) <= 1000;
