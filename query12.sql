/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

SELECT
    COUNT(*) AS num_stations
FROM
    indego.station_statuses
WHERE
    ST_DWithin(
        ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::GEOGRAPHY,
        ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::GEOGRAPHY,
        1000 -- Distance in meters
    );

