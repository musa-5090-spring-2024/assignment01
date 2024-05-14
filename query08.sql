/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

CREATE TABLE indego.trips AS
SELECT * FROM trips_2022_q3
UNION ALL
SELECT * FROM trips_2021_q3;

SELECT 
    start_station,
    CONCAT('(', start_lat, ', ', start_lon, ')') AS start_geog,
    COUNT(*) AS num_trips
FROM 
    trips
WHERE 
    EXTRACT(HOUR FROM start_time) >= 7 AND EXTRACT(HOUR FROM start_time) < 10
GROUP BY 
    start_station, start_geog
ORDER BY 
    num_trips DESC
LIMIT 5;


/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
