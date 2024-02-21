--query 2
SELECT
  ROUND(
    CAST(
      (
        ((SELECT COUNT(*) FROM indego.trips_2022_q3) - (SELECT COUNT(*) FROM indego.trips_2021_q3)) 
        / 
        CAST((SELECT COUNT(*) FROM indego.trips_2021_q3) AS FLOAT) * 100
      ) 
    AS NUMERIC),
    2
  ) AS perc_change;

--query 3
  SELECT * FROM indego.trips_2021_q3
  LIMIT 10;

  SELECT
  ROUND(
    CAST(
      (SELECT avg(duration)FROM indego.trips_2021_q3)
    AS NUMERIC),
    2
  ) AS avg_duration;

--query 4
   SELECT
  ROUND(
    CAST(
      (SELECT avg(duration)FROM indego.trips_2022_q3)
    AS NUMERIC),
    2
  ) AS avg_duration;

--query 5
SELECT
      GREATEST(
        (SELECT MAX(duration) FROM indego.trips_2022_q3),
        (SELECT MAX(duration) FROM indego.trips_2021_q3)
  ) AS max_duration;


--query 6
SELECT '2021' AS trip_year, '3' AS trip_quarter, COUNT(*) AS num_trips
FROM indego.trips_2021_q3
WHERE duration < 10
UNION ALL
SELECT '2022' AS trip_year, '3' AS trip_quarter, COUNT(*) AS num_trips
FROM indego.trips_2022_q3
WHERE duration < 10;


--query 7
SELECT '2021' AS trip_year, '3' AS trip_quarter, COUNT(*) AS num_trips
FROM indego.trips_2021_q3
WHERE EXTRACT(DOY FROM start_time) != EXTRACT(DOY FROM end_time)
UNION ALL
SELECT '2022' AS trip_year, '3' AS trip_quarter, COUNT(*) AS num_trips
FROM indego.trips_2022_q3
WHERE EXTRACT(DOY FROM start_time) != EXTRACT(DOY FROM end_time);

--query 8

SELECT 
    station_id,
    station_geog,
    SUM(num_trips) AS num_trips
FROM (
    SELECT start_station AS station_id, 
        ST_MakePoint(start_lon, start_lat)::geography AS station_geog,
        COUNT(*) AS num_trips
    FROM indego.trips_2021_q3
    WHERE EXTRACT(HOUR FROM start_time) IN (7, 8, 9)
    GROUP BY start_station, start_lon, start_lat

    UNION ALL

    SELECT start_station AS station_id, 
        ST_MakePoint(start_lon, start_lat)::geography AS station_geog,
        COUNT(*) AS num_trips
    FROM indego.trips_2022_q3
    WHERE EXTRACT(HOUR FROM start_time) IN (7, 8, 9)
    GROUP BY start_station, start_lon, start_lat
) GROUP BY station_id, station_geog
ORDER BY num_trips DESC
LIMIT 5;


--query 9
SELECT 
    passholder_type, 
    SUM(num_trips) AS num_trips
FROM (
    SELECT 
        passholder_type, 
        COUNT(*) AS num_trips
    FROM indego.trips_2021_q3
    GROUP BY passholder_type

    UNION ALL

    SELECT 
        passholder_type, 
        COUNT(*) AS num_trips
    FROM indego.trips_2022_q3
    GROUP BY passholder_type
)
GROUP BY passholder_type
ORDER BY passholder_type;

--query 10
SELECT
    id AS station_id,
    geog AS station_geog,
    ROUND(ST_DISTANCE(ST_MAKEPOINT(-75.192584, 39.952415)::geography, geog::geography)/50)*50 AS distance
FROM
    indego.station_statuses
ORDER BY
    distance DESC;


--query 11
SELECT 
ROUND(
    (AVG(ST_Distance(geog::geography, ST_MakePoint(-75.192584, 39.952415)::geography)/1000))::numeric, 0) AS avg_distance_km
FROM 
    indego.station_statuses;

--query 12
SELECT count(*) as num_stations
FROM indego.station_statuses
WHERE (ST_Distance(geog::geography, ST_MakePoint(-75.192584, 39.952415)::geography)) < 1000;

--query 13
SELECT
    id AS station_id,
    name AS station_name,
    ROUND(
    (ST_DISTANCE(geog::geography, ST_MAKEPOINT(-75.192584, 39.952415)::geography))/50)*50 AS distance
FROM indego.station_statuses
ORDER BY
    distance DESC
LIMIT 1;

--query 14
SELECT
    id AS station_id,
    name AS station_name,
    ROUND((ST_DISTANCE(geog::geography, ST_MAKEPOINT(-75.192584, 39.952415)::geography))/50)*50 AS distance
FROM indego.station_statuses
ORDER BY
    distance
LIMIT 1;
