/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

SELECT start_station AS station_id,
       COUNT(*) AS num_trips,
	   st_setsrid(st_makepoint(start_lon::float, start_lat::float), 4326) AS station_geog
FROM (
    SELECT start_station, start_lon, start_lat
    FROM indego.trips_2021_q3
    WHERE EXTRACT(HOUR FROM start_time) >= 7
      AND EXTRACT(HOUR FROM start_time) <= 9
    UNION ALL
    SELECT start_station, start_lon, start_lat
    FROM indego.trips_2022_q3 	
    WHERE EXTRACT(HOUR FROM start_time) >= 7
      AND EXTRACT(HOUR FROM start_time) <= 9
) AS combined_tables
GROUP BY start_station, start_lon, start_lat
ORDER BY num_trips DESC
LIMIT 5;


/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
