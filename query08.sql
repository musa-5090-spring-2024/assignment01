-- Active: 1707329957355@@localhost@5432@m509A1
/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here

SELECT
    start_station AS station_id,
    ST_SetSRID(st_makepoint(start_lon, start_lat), 4326) AS station_geog,
    COUNT(*) AS num_trips
FROM (
    SELECT start_station, start_lat, start_lon FROM indego.trips_2021_q3
    WHERE start_time::time >= '07:00:00' AND start_time::time < '10:00:00'
    UNION ALL
    SELECT start_station, start_lat, start_lon FROM indego.trips_2022_q3
    WHERE start_time::time >= '07:00:00' AND start_time::time < '10:00:00'
) AS trips_both
GROUP BY station_id, station_geog
ORDER BY num_trips DESC
LIMIT 5;










/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
