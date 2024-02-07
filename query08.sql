/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here
-- !!working answer!! 
select
	start_station as station_id ,
	count(start_station) as num_trips,
	ST_SetSrid(ST_MakePoint(start_lon::float, start_lat::float),4326) as station_geog
from 
	((select *
		from indego.trips_2021_q3
		where extract(hour from start_time::timestamp) >=7 and extract(hour from start_time::timestamp) < 10)
	union
	(select *
		from indego.trips_2022_q3
		where extract(hour from start_time::timestamp) >=7 and extract(hour from start_time::timestamp) < 10)
 	)
group by start_station, start_lon, start_lat
order by num_trips desc
limit 5;

/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
