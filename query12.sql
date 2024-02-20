/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here
SELECT COUNT(*) AS num_stations_within_1km
FROM station_status
WHERE ST_DWithin(geom_32129,ST_Transform(ST_SetSRID(
    ST_MakePoint(-75.192584, 39.952415), 4326),32129), 1000);
/* result: 16
*/
