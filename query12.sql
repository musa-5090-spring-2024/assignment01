/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here
select count(*) as num_stations
from 
	(select cast(st_distance(cast(ST_GeomFromText('POINT(-75.192584 39.952415)',4326) as geography), geog) as numeric) as dist_to_Meyer
	 from indego.station_statuses)
where dist_to_Meyer <= 1000;