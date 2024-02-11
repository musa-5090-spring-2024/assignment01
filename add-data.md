# create table
DROP TABLE IF EXISTS indego.trips_2021_q3;
CREATE TABLE indego.trips_2021_q3
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

# adjust csv (do not need this here)
csvcut ./data/indego-trips-2021-q3.csv -c 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15 > ./data/indego-trips-2021-q3-clean.csv

csvcut -n ./data/indego-trips-2021-q3.csv

# put into database
COPY indego.trips_2021_q3    [Your table name!!!]
FROM 'D:\UPenn\Class\Spring 2024\Cloud\musa-cloud-assignment01\data\indego-trips-2021-q3-clean.csv'
WITH (FORMAT csv, HEADER true);

# station table
DROP TABLE IF EXISTS indego.station_statuses;
CREATE TABLE indego.station_statuses
(
  id INTEGER,
  name TEXT,
  geog GEOGRAPHY
);

INSERT INTO indego.station_statuses (id, name, geog)
SELECT id, name, geog
FROM indego.stations_geo