/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

-- Enter your SQL query here
SELECT
id as station_id,
ST_SetSRID(ST_MakePoint(longitude, latitude), 4326) AS station_geog,
round(st_distance(ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::geography, ST_SetSRID(st_makepoint(-75.192584,39.952415),4326)::geography)/50)*50 as distance 
from indego_station_statuses