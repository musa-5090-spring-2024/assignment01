-- Load data
ogr2ogr \
-f "PostgreSQL" \
-nln "station_statuses" \
-lco "SCHEMA=indego" \
-lco "GEOM_TYPE=geography" \
-lco "GEOMETRY_NAME=geog" \
-lco "OVERWRITE=yes" \
PG:"host=localhost port=5432 dbname=musaw3 user=postgres password=postgres" \
"data/indego_stations.geojson"

select *
from indego.station_statuses;

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
)

copy indego.trips_2021_q3
from '/Users/shuaiwang/Documents/MUSA-Cloud/MUSA-cloud-assignment1/data/indego-trips-2021-q3.csv'
with (format csv, header true);

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
)

copy indego.trips_2022_q3
from '/Users/shuaiwang/Documents/MUSA-Cloud/MUSA-cloud-assignment1/data/indego-trips-2022-q3.csv'
with (format csv, header true);

select *
from indego.trips_2021_q3

SELECT * FROM indego.trips_2021_q3 LIMIT 10;


alter table indego.stations
alter column go_live_date type date
    using to_date(go_live_date, 'MM/DD/YYYY');