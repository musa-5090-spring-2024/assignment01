/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

SELECT
    ROUND(
        AVG(
            SQRT(
                POWER((latitude - 39.952415) * 111319, 2) +
                POWER((longitude - (-75.192584)) * 111319 * COS(RADIANS(39.952415)), 2)
            )
        ) / 1000
    ) AS avg_distance_km
FROM
    indego_stations;