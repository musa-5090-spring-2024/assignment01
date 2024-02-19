/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here

with temptable as (
    select *
    from indego.trips_2021_q3
    union
    select *
    from indego.trips_2022_q3
)

select
    start_station as station_id,
    ST_MakePoint(start_lon, start_lat)::geography as station_geog,
    count(*) as num_trips
from temptable 
where extract('hour' from start_time) >= 7 and 
        extract('hour' from start_time) < 10
group by station_id, station_geog
order by num_trips DESC
limit 5

/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
