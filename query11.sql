/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here

select
    round(avg(st_distance (
        geog,
        st_makepoint(-75.192584, 39.952415)
    ))/1000) as avg_distance_km
from indego.station_statuses