/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here
select cast(round(avg(cast(st_distance(cast(ST_GeomFromText('POINT(-75.192584 39.952415)',4326) as geography), geog) as numeric)),-3)/1000 as integer) as avg_distance_km
from 
	indego.station_statuses;