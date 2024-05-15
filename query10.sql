/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

-- Enter your SQL query here
CREATE TABLE indego_stations (
    station_id INT,
    station_name VARCHAR(255),
    latitude FLOAT,
    longitude FLOAT,
    num_bikes_available INT,
    num_docks_available INT,
    is_renting BOOLEAN,
    is_returning BOOLEAN
);

SELECT
    station_id,
    CONCAT('(', latitude, ', ', longitude, ')') AS station_geog,
    ROUND(
        SQRT(
            POWER((latitude - 39.952415) * 111319, 2) +
            POWER((longitude - (-75.192584)) * 111319 * COS(RADIANS(39.952415)), 2)
        ) / 50
    ) * 50 AS distance
FROM
    indego_stations;
