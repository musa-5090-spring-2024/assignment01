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
    combine.start_station AS station_id,
    station_statuses.geog::GEOGRAPHY AS station_geog,
    COUNT(*) AS num_trips
FROM (
    SELECT *
    FROM indego.trips_2021_q3
    UNION
    SELECT *
    FROM indego.trips_2022_q3
) AS combine LEFT JOIN indego.station_statuses
    ON combine.start_station::INTEGER = indego.station_statuses.id
WHERE EXTRACT(HOUR FROM combine.start_time) >= 7 AND EXTRACT(HOUR FROM combine.start_time) < 10
GROUP BY station_id, station_geog
ORDER BY num_trips DESC
LIMIT 5;

/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
