/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

SELECT
    id AS station_id,
    ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)  AS station_geog,
    ROUND (ST_Distance(
       ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::GEOGRAPHY,
        ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::GEOGRAPHY
    ) / 50.0) * 50 AS distance
FROM
    indego.station_statuses;





