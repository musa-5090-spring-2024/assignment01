/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here
SELECT
id AS station_id,
name as station_name,
st_distance(st_setSRID(st_makepoint(longitude,latitude),4326)::geography, st_setSRID(st_makepoint(-75.192584,39.952415),4326)::geography) as distance
FROM
indego_station_statuses
ORDER BY distance ASC
LIMIT 1 