/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

SELECT
    id AS station_id,
    name AS station_name,
    ROUND(ST_Distance(
       ST_SetSRID(ST_MakePoint(longitude, latitude), 4326)::GEOGRAPHY,
        ST_SetSRID(ST_MakePoint(-75.192584, 39.952415), 4326)::GEOGRAPHY
    ) / 50.0) * 50 AS distance
FROM
    indego.station_statuses
ORDER BY
    distance ASC
LIMIT
    1;
