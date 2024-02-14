/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

-- Enter your SQL query here
SELECT 
    id AS station_id, 
    geometry AS station_geog,
    ROUND((ST_Distance(
        ST_SetSRID(geometry, 4326)::geometry,
        ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::geometry
    ) / 50)) * 50 AS distance
FROM 
    indego.station_statuses

-- ORDER BY
-- distance ASC
-- LIMIT 5

-- SELECT 
