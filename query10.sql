/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

-- Enter your SQL query here
select  id as station_id,
	floor(round(cast(st_distance(cast(ST_GeomFromText('POINT(-75.192584 39.952415)',4326) as geography), geog) as numeric)/50,0))*50 as distance, 
	geog as station_geog
from 
	indego.station_statuses
order by distance desc;


-- notes to self:
--	1) st_distance returns coordinate distance if given geometries
--	and meters if given geographies;
--	2) round to nearest n (where n <> 10) requires floor (x/n)*n rather than ROUND()