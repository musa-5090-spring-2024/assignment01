/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here
SELECT
    ROUND(AVG(ST_Distance(
        geog,
        ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::GEOGRAPHY
    ))/1000) AS average_distance_KM
FROM
    indego.station_statuses;