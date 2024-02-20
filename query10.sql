/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

-- Enter your SQL query here
ALTER TABLE station_status
ADD COLUMN geom_32129 geometry;

UPDATE station_status SET
    geom_32129 = st_transform(the_geog::geometry, 32129);

SELECT id,geom_32129 AS station_geog,
ROUND(ST_Distance(geom_32129, ST_Transform
    (ST_SetSRID(ST_Makepoint(-75.192584, 39.952415), 4326),32129)
    )/50)*50 AS distance
FROM station_status;
/* first 5 results: 
3007	"0101000020817D00000FD9B77591102941C91791C7CE60F140"	2900
3008	"0101000020817D00009A93269DD6152941B1CD16077B59F240"	4750
3009	"0101000020817D0000883A838C5AFC28419FC774BF9CA5F140"	450
3010	"0101000020817D00008FF46F0A590C29417A0AF877496DF140"	2350
3012	"0101000020817D0000BE06F112F00429419E81EC405449F140"	1700
*/
