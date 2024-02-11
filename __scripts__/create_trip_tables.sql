
create schema if not exists indego;

drop table if exists indego.trips_2021_q3;

create table indego.trips_2021_q3 (
    trip_id text,
    duration integer,
    start_time timestamp,
    end_time timestamp,
    start_station text,
    start_lat float,
    start_lon float,
    end_station text,
    end_lat float,
    end_lon float,
    bike_id text,
    plan_duration integer,
    trip_route_category text,
    passholder_type text,
    bike_type text
);

drop table if exists indego.trips_2022_q3;

create table indego.trips_2022_q3 (
    trip_id text,
    duration integer,
    start_time timestamp,
    end_time timestamp,
    start_station text,
    start_lat float,
    start_lon float,
    end_station text,
    end_lat float,
    end_lon float,
    bike_id text,
    plan_duration integer,
    trip_route_category text,
    passholder_type text,
    bike_type text
);

create extension if not exists postgis;


COPY indego.trips_2021_q3
FROM 'C:\Users\Public\MUSA509\A1\indego_trips_2021_q3.csv'
WITH (FORMAT csv,HEADER true);

ALTER TABLE indego.trips_2021_q3
ALTER COLUMN start_time TYPE DATE
  USING to_date(start_time,'MM/DD/YYYY')


COPY indego.trips_2022_q3
FROM 'C:\Users\Public\MUSA509\A1\indego_trips_2022_q3.csv'
WITH (FORMAT csv,HEADER true);
