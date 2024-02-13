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
  st_setsrid(
    ST_MakePoint(start_lon, start_lat), 4326) 
    AS station_geog,
  COUNT(*) AS num_trips
FROM
     (SELECT * FROM indego.trips_2021_q3
      UNION ALL
      SELECT * FROM indego.trips_2022_q3) 
      AS combined_trips
WHERE
  EXTRACT(HOUR FROM start_time) >= 7 AND
  EXTRACT(HOUR FROM start_time) < 10
GROUP BY
  start_station, start_lon, start_lat
ORDER BY
  num_trips DESC
LIMIT 5;

/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
