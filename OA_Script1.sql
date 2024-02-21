CREATE SCHEMA IF NOT EXISTS indego;

CREATE TABLE indego.trips_2021_q3 (
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

COPY indego.trips_2021_q3
FROM '/Users/oliveratwood/Documents/GitHub/musa-5090/course-info/assignment01/data/indego-trips-2021-q3.csv'
WITH (FORMAT csv, HEADER true);

CREATE TABLE indego.trips_2022_q3 (
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

COPY indego.trips_2022_q3
FROM '/Users/oliveratwood/Documents/GitHub/musa-5090/course-info/assignment01/data/indego-trips-2022-q3.csv'
WITH (FORMAT csv, HEADER true);


CREATE EXTENSION IF NOT EXISTS postgis;

DROP TABLE IF EXISTS indego.station_statuses;

CREATE TABLE indego.station_statuses (
    id SERIAL PRIMARY KEY,
    name TEXT,
    geog GEOGRAPHY
);



-----------------------------------------
--Query 1
--How many bike trips in Q3 2021?

--Query 2
--What is the percent change in trips in Q3 2022 as compared to Q3 2021?

--Query 3
--What is the average duration of a trip for 2021?

--Query 4
--What is the average duration of a trip for 2022?

--Query 5
--What is the longest duration trip across the two quarters?

--Query 6
--How many trips in each quarter were shorter than 10 minutes?

--Query 7
--How many trips started on one day and ended on a different day? 

--Query 8
--Give the five most popular starting stations across all years between 7am and 9:59am.
--_Hint: Use the `EXTRACT` function to get the hour of the day from the timestamp._

--Query 9
--List all the passholder types and number of trips for each across all years.

--Query 10
--Using the station status dataset, find the distance in meters of each station from Meyerson Hall. use latitude `39.952415` and longitude `-75.192584` as the coordinates for the building

--Query 11
--What is the average distance (in meters) of all stations from Meyerson Hall?

--Query 12
--How many stations are within 1km of Meyerson Hall?

--Query 13
--Which station is furthest from Meyerson Hall?

--Query 14
--Which station is closest to Meyerson Hall?
