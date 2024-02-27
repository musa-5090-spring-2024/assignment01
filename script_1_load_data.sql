CREATE EXTENSION if not exists postgis;
create schema if not exists indego;

-- 2021 q3, loading the data 

DROP TABLE if exists indego.trips_2021_q3;
CREATE TABLE if not exists indego.trips_2021_q3 (
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

copy indego.trips_2021_q3
from 'D:\Spring_2024\Cloud\MUSA509_assignment01\indego-trips-2021-q3\indego-trips-2021-q3.csv'
with (format csv, header true);

-- 2022 q3 loading the data

DROP TABLE if exists indego.trips_2022_q3;
CREATE TABLE if not exists indego.trips_2022_q3 (
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

copy indego.trips_2022_q3
from 'D:\Spring_2024\Cloud\MUSA509_assignment01\indego-trips-2022-q3\indego-trips-2022-q3.csv'
with (format csv, header true);

-- loading the station status

DROP TABLE if exists indego.station_statuses;
CREATE TABLE if not exists indego.station_statuses (
	id INTEGER,
	name TEXT,
	geog GEOGRAPHY
);

copy indego.station_statuses
from 'D:\Spring_2024\Cloud\MUSA509_assignment01\phl.geojson'
with (format csv, header true);

select count(*) as num_trips
from indego.trips_2021_q3
