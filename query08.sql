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
start_station as station_id,
 start_lon || ',' ||start_lat AS station_geog,
count(*) as num_trips
from (SELECT start_lon, start_lat, start_station 
from indego.trips_2021_q3
where extract( HOUR from start_time) >= 7 and extract(HOUR from start_time) < 10 
UNION ALL
SELECT start_lon, start_lat, start_station 
from indego.trips_2022_q3
where extract( HOUR from start_time) >= 7 and extract(HOUR from start_time) < 10 )
GROUP BY start_station ,start_lon,start_lat
ORDER BY num_trips DESC
LIMIT 5


/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
