/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here

WITH all_trips AS (
    SELECT
        start_station AS station_id,
        ST_SETSRID(ST_MAKEPOINT(NULLIF(start_lon, '')::numeric, NULLIF(start_lat, '')::numeric), 4326) AS station_geog,
        TO_TIMESTAMP(start_time, 'MM-DD-YYYY HH24:MI:SS') AS start_time
    FROM indego_trips_2021_q3
    WHERE start_lon != '' AND start_lat != ''
    UNION ALL
    SELECT
        start_station AS station_id,
        ST_SETSRID(ST_MAKEPOINT(NULLIF(start_lon, '')::numeric, NULLIF(start_lat, '')::numeric), 4326) AS station_geog,
        TO_TIMESTAMP(start_time, 'MM-DD-YYYY HH24:MI:SS') AS start_time
    FROM indego_trips_2022_q3
    WHERE start_lon != '' AND start_lat != ''
)

SELECT
    station_id,
    station_geog,
    COUNT(*) AS num_trips
FROM
    all_trips
WHERE
    EXTRACT(HOUR FROM start_time) BETWEEN 7 AND 9
GROUP BY
    station_id,
    station_geog
ORDER BY
    num_trips DESC
LIMIT 5;


/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
