/*
    Which station is furthest from Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here
SELECT id,geom_32129 AS station_geog,name,
ROUND(ST_Distance(geom_32129, ST_Transform
    (ST_SetSRID(ST_Makepoint(-75.192584, 39.952415), 4326),32129)
    )/50)*50 AS distance
FROM station_status
Order BY distance DESC
LIMIT 1;
/* result:
3323	"0101000020817D0000A5C9DFC449E1284154FAAB4CA094F340"	"Manayunk Bridge"	8900
*/
