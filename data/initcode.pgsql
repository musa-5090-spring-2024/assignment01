alter database "m509A1" set search_path to indego;


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

