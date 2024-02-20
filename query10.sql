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
FROM station_status
Order BY distance DESC;
/* first 5 (farthest 5)  results: 3323	"0101000020817D0000A5C9DFC449E1284154FAAB4CA094F340"	8900
                    3329	"0101000020817D0000625870937DE328419CAA8B35108BF340"	8650
                    3335	"0101000020817D0000E695C29EE4E7284133313A93546FF340"	8050
                    3370	"0101000020817D000076C98255C5EB2841A7C6DA8E1446F340"	7300
                    3183	"0101000020817D00009578873BB6062941C9A0684621BEEF40"	7050
*/
