create schema if not exists indego;

-- create indego trip data 2021 Q3 --

drop table if exists indego.trips_2021_q3;

create table if not exists indego.trips_2021_q3 (
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
from '/Users/xiaofan/Documents/GitHub/assignment01/data/indego-trips-2021-q3.csv'
with (format csv, header true);

-- create indego trip data 2022 Q3 --
drop table if exists indego.trips_2022_q3;

create table if not exists indego.trips_2022_q3 (
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
from '/Users/xiaofan/Documents/GitHub/assignment01/data/indego-trips-2022-q3.csv'
with (format csv, header true);

-- create indego station status --
select
    id,
    name,
    geog,
    latitude,
    longitude
from indego.station_statuses
limit 20;

create extension if not exists postgis;
