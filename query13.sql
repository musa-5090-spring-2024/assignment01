/*
    Which station is furthest from Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here
SELECT
station_id,
station_name,
ROUND((ST_Distance(
        ST_SetSRID(geometry, 4326)::geography,
        ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::geography
    ) / 50)) * 50 AS distance
FROM
    indego.station_statuses
ORDER BY
distance DESC
limit 1
