/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here
WITH morning_trips AS (
    SELECT start_station, station_geog
    FROM indego.trips_2021_q3
    WHERE EXTRACT(HOUR FROM start_time) >= 7 AND EXTRACT(HOUR FROM start_time) < 10
    UNION ALL
    SELECT start_station, station_geog
    FROM indego.trips_2022_q3
    WHERE EXTRACT(HOUR FROM start_time) >= 7 AND EXTRACT(HOUR FROM start_time) < 10
),
aggregated_trips AS (
    SELECT start_station, COUNT(*) AS num_trips
    FROM morning_trips
    GROUP BY start_station
    ORDER BY num_trips DESC
    LIMIT 5
)
SELECT at.start_station AS station_id, mt.station_geog, at.num_trips
FROM aggregated_trips at
JOIN morning_trips mt ON at.start_station = mt.start_station
GROUP BY at.start_station, mt.station_geog, at.num_trips
ORDER BY at.num_trips DESC;


/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here


/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
