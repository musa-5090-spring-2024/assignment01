/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here
SELECT
    count(*) as num_stations
from indego.station_statuses
where 
    ST_DWithin(
        geog, 
        ST_setsrid(ST_MakePoint(-75.192584, 39.952415), 4326)::geography, 1000);
