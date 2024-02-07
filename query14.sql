/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here
select id as station_id, name as station_name, floor(round(dist_to_Meyer/50,0))*50 as distance
from 
	(select *,
	 		cast(st_distance(cast(ST_GeomFromText('POINT(-75.192584 39.952415)',4326) as geography), geog) as numeric) as dist_to_Meyer
	 from indego.station_statuses)
order by distance asc
limit 1;
