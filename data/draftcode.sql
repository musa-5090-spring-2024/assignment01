DROP TABLE IF EXISTS indego.trips_2022_q3;

CREATE TABLE indego.trips_2022_q3
(
	trip_id TEXT,
	duration INTEGER,
	start_time TIMESTAMP,
	end_time TIMESTAMP,
	start_station TEXT,
	start_lat FLOAT,
	start_lon FLOAT,
	end_station TEXT,
	end_lat FLOAT,
	end_lon FLOAT,
	bike_id TEXT,
	plan_duration INTEGER,
	trip_route_category TEXT,
	passholder_type TEXT,
	bike_type TEXT
);


--- Question 1

select count(*) as num_trips
from indego.trips_2021_q3

--- Question 2 What is the percent change in trips in Q3 2022 as compared to Q3 2021

SELECT ROUND(100 * (t2.trip22 * 1.00 - t1.trip21) / t1.trip21, 2)::text || '%' AS perc_change
FROM (
    SELECT COUNT(*) AS trip21
    FROM indego.trips_2021_q3
) AS t1 CROSS JOIN (
    SELECT COUNT(*) AS trip22
    FROM indego.trips_2022_q3
) AS t2;

--- Question 3 What is the average duration of a trip for 2021?

SELECT ROUND(AVG(duration),2) AS avg_duration
FROM indego.trips_2021_q3

--- Question 4 What is the average duration of a trip for 2021?
SELECT ROUND(AVG(duration),2) AS avg_duration
FROM indego.trips_2022_q3

--- Question 5 What is the longest duration trip across the two quarters?

SELECT GREATEST(max21, max22) AS max_duration
FROM (
    SELECT MAX(duration) AS max21
    FROM indego.trips_2021_q3
) AS t1 CROSS JOIN (
    SELECT MAX(duration) AS max22
    FROM indego.trips_2022_q3
) AS t2;

--- Question 6 How many trips in each quarter were shorter than 10 minutes?

SELECT 
    EXTRACT(YEAR FROM start_time) AS trip_year,
    EXTRACT(QUARTER FROM start_time) AS trip_quarter,
    COUNT(*) AS num_trips
FROM indego.trips_2021_q3
WHERE duration < 10
GROUP BY EXTRACT(YEAR FROM start_time), EXTRACT(QUARTER FROM start_time)
UNION
SELECT 
    EXTRACT(YEAR FROM start_time) AS trip_year,
    EXTRACT(QUARTER FROM start_time) AS trip_quarter,
    COUNT(*) AS num_trips
FROM indego.trips_2022_q3
WHERE duration < 10
GROUP BY EXTRACT(YEAR FROM start_time), EXTRACT(QUARTER FROM start_time);

--- Question 7 How many trips started on one day and ended on a different day?

SELECT 
    EXTRACT(YEAR FROM start_time) AS trip_year,
    EXTRACT(QUARTER FROM start_time) AS trip_quarter,
	COUNT(*) AS num_trip
FROM indego.trips_2021_q3
WHERE EXTRACT(DAY FROM start_time) != EXTRACT(DAY FROM end_time)
GROUP BY EXTRACT(YEAR FROM start_time), EXTRACT(QUARTER FROM start_time)
UNION
SELECT 
    EXTRACT(YEAR FROM start_time) AS trip_year,
    EXTRACT(QUARTER FROM start_time) AS trip_quarter,
	COUNT(*) AS num_trip
FROM indego.trips_2022_q3
WHERE EXTRACT(DAY FROM start_time) != EXTRACT(DAY FROM end_time)
GROUP BY EXTRACT(YEAR FROM start_time), EXTRACT(QUARTER FROM start_time)

--- Question 8 Give the five most popular starting stations across all years between 7am and 9:59am.

SELECT 
    station_id,
	station_geog::geography, 
    COUNT(*) AS num_trip
FROM (
    SELECT 
        start_station AS station_id,
	    ST_GeomFromText('POINT(' || start_lon::text || ' ' || start_lat::text || ')') AS station_geog
    FROM indego.trips_2021_q3
    WHERE EXTRACT(HOUR FROM start_time) >=7 AND EXTRACT(HOUR FROM start_time) < 10
    UNION ALL
    SELECT 
        start_station AS station_id,
	    ST_GeomFromText('POINT(' || start_lon::text || ' ' || start_lat::text || ')') AS station_geog
    FROM indego.trips_2022_q3
    WHERE EXTRACT(HOUR FROM start_time) >=7 AND EXTRACT(HOUR FROM start_time) < 10
) AS combined_trips
GROUP BY station_id, station_geog
ORDER BY num_trip DESC
LIMIT 5;

--- Question 9 List all the pass-holder type and number of trips for each across all years.

SELECT 
    passholder_type,
    COUNT(*) AS num_trip
FROM (
    SELECT 
        passholder_type
    FROM indego.trips_2021_q3
    UNION ALL
    SELECT 
        passholder_type
    FROM indego.trips_2022_q3
) AS combined_trips
GROUP BY passholder_type

--- Question 10 Find the distance in meters of each station from Meyerson Hall. 
--- Use latitude 39.952415 and longitude -75.192584 as the coordinates for Meyerson Hall.

SELECT
    id AS station_id,
    geog AS station_geog,
    ROUND(ST_Distance(geog, 'POINT(-75.192584 39.952415)'::geography) / 50) * 50 AS distance
FROM
    indego.station_statuses;

--- Question 11   What is the average distance (rounded to the nearest km) of all stations from Meyerson Hall? 
--- Your result should have a single record with a single column named avg_distance_km.

SELECT 
	ROUND(AVG(ST_Distance(geog, 'POINT(-75.192584 39.952415)'::geography)) / 1000) AS avg_distance_km
FROM 
	indego.station_statuses;

--- Question 12 How many stations are within 1km of Meyerson Hall?

SELECT COUNT(*) AS num_stations
FROM indego.station_statuses
WHERE ST_DWithin(
    geog,
    'POINT(-75.192584 39.952415)'::geography,
    1000
);

--- Question 13 Which station is furthest from Meyerson Hall?

SELECT
    id AS station_id,
    name AS station_name,
	ROUND(ST_Distance(geog, 'POINT(-75.192584 39.952415)'::geography) / 50) * 50 AS distance
FROM
    indego.station_statuses
ORDER BY distance DESC
LIMIT 1

--- Question 14 Which station is closest to Meyerson Hall?

SELECT
    id AS station_id,
    name AS station_name,
	ROUND(ST_Distance(geog, 'POINT(-75.192584 39.952415)'::geography) / 50) * 50 AS distance
FROM
    indego.station_statuses
ORDER BY distance ASC
LIMIT 1



