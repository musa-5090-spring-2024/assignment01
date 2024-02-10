/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here
SELECT
count (*) as num_stations
from indego_station_statuses
where st_distance(st_setSRID(st_makepoint(longitude,latitude),4326)::geography, st_setSRID(st_makepoint(-75.192584,39.952415),4326)::geography) < 1000
