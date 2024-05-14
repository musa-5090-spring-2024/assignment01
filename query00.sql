-- Active: 1708533339248@@127.0.0.1@5432@assignment01
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

copy indego.trips_2021_q3
from 'C:\Users\cruse\OneDrive\Desktop\Spring_2024\MUSA_5090\assignment01-1\data\indego-trips-2021-q3.csv'
with (format csv, header true);