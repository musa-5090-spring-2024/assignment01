/*
    Which station is furthest from Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

SELECT
    station_id,
    station_name,
    ROUND(
        SQRT(
            POWER((latitude - 39.952415) * 111319, 2) +
            POWER((longitude - (-75.192584)) * 111319 * COS(RADIANS(39.952415)), 2)
        ) / 50
    ) * 50 AS distance
FROM
    indego_stations
ORDER BY
    distance DESC
LIMIT 1;