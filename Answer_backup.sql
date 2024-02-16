-- Question 2
-- SELECT 
--     ROUND(((SELECT COUNT(*) FROM indego.trips_2022_q3) - 
--            (SELECT COUNT(*) FROM indego.trips_2021_q3)) / 
--           (SELECT COUNT(*) FROM indego.trips_2021_q3)::numeric * 100, 2) AS perc_change;

-- Question 3
-- SELECT AVG(duration::numeric) AS avg_duration
-- FROM indego.trips_2021_q3;

-- Question 4
-- SELECT AVG(duration::numeric) AS avg_duration
-- FROM indego.trips_2022_q3;

-- Question 5
-- SELECT MAX(duration::numeric) AS max_duration
-- FROM(
-- 	SELECT duration
-- 	FROM indego.trips_2021_q3
-- 	UNION ALL
-- 	SELECT duration
-- 	FROM indego.trips_2022_q3
-- );

-- Question 6
-- SELECT '2021' AS trip_year, 'Q3' AS trip_quarter, COUNT(*) AS num_trips
-- FROM indego.trips_2021_q3
-- WHERE duration::numeric < 10
-- UNION ALL
-- SELECT '2022' AS trip_year, 'Q3' AS trip_quarter, COUNT(*) AS num_trips
-- FROM indego.trips_2022_q3
-- WHERE duration::numeric < 10

-- Question 7
-- SELECT '2021' AS trip_year, 'Q3' AS trip_quarter, COUNT(*) AS num_trips
-- FROM indego.trips_2021_q3
-- WHERE EXTRACT(DAY FROM CAST(start_time AS DATE)) <> EXTRACT(DAY FROM CAST(end_time AS DATE))
-- UNION ALL
-- SELECT '2022' AS trip_year, 'Q3' AS trip_quarter, COUNT(*) AS num_trips
-- FROM indego.trips_2022_q3
-- WHERE EXTRACT(DAY FROM CAST(start_time AS DATE)) <> EXTRACT(DAY FROM CAST(end_time AS DATE))

-- Question 8
-- SELECT 
--     start_station,
--     ST_SetSRID(ST_Point(start_lon::numeric, start_lat::numeric), 4326) AS station_geog,
--     COUNT(*) AS num_trips
-- FROM (
--     SELECT 
--         start_station, 
--         start_lon, 
--         start_lat,
--         start_time::timestamp
--     FROM 
--         indego.trips_2021_q3
--     UNION ALL
--     SELECT 
--         start_station, 
--         start_lon, 
--         start_lat,
--         start_time::timestamp
--     FROM 
--         indego.trips_2022_q3
-- )
-- WHERE 
--     EXTRACT(HOUR FROM start_time) >= 7 AND 
--     EXTRACT(HOUR FROM start_time) < 10
-- GROUP BY 
--     start_station, 
--     start_lon, 
--     start_lat
-- ORDER BY 
--     num_trips DESC
-- LIMIT 5;

-- Question 9
-- SELECT 
-- 	passholder_type,
-- 	COUNT(*) AS num_trips
-- FROM(
--     SELECT 
--         passholder_type
--     FROM 
--         indego.trips_2021_q3
--     UNION ALL
--     SELECT 
--         passholder_type
--     FROM 
--         indego.trips_2022_q3
-- )
-- GROUP BY
-- passholder_type;

-- Question 10
-- ALTER TABLE indego.station_statuses
--     add column geom_32129 geometry;

UPDATE indego.station_statuses SET
    geom_32129 = st_transform(the_geog::geometry, 32129);
	
-- SELECT 
-- 	id,
-- 	geom_32129 AS station_geog,
-- 	ROUND(ST_Distance(
-- 		geom_32129, 
-- 		ST_Transform(
--             ST_SetSRID(
--                 ST_Makepoint(-75.192584, 39.952415), 
--                 4326
--             ),
--             32129
--         ))/50)*50 AS distance
-- FROM indego.station_statuses;

-- Question 11
-- SELECT
-- ROUND(AVG(ST_Distance(
-- 		geom_32129, 
-- 		ST_Transform(
--             ST_SetSRID(
--                 ST_Makepoint(-75.192584, 39.952415), 
--                 4326
--             ),
--             32129
--         )))/1000) AS avg_distance_km
-- FROM indego.station_statuses;

-- Question 12
-- SELECT 
--     COUNT(*) AS num_stations
-- FROM 
--     indego.station_statuses
-- WHERE 
--     ST_DWithin(
--         geom_32129,
--         ST_Transform(
--             ST_SetSRID(
--                 ST_Makepoint(-75.192584, 39.952415), 
--                 4326
--             ),
--             32129
--         ),
--         1000
--     );
-- SELECT COUNT(*) AS num_stations
-- FROM indego.station_statuses
-- WHERE
--     geom_32129 IN (
--         ST_DWITHIN(
--             ST_TRANSFORM(
--                 ST_SETSRID(
--                     ST_MAKEPOINT(-75.192584, 39.952415),
--                     4326
--                 ),
--                 32129
--             ),
--             1000
--         )
--     );
-- Question 13
-- SELECT 
-- 	id,
-- 	name,
-- 	ROUND(ST_Distance(
-- 		geom_32129, 
-- 		ST_Transform(
--             ST_SetSRID(
--                 ST_Makepoint(-75.192584, 39.952415), 
--                 4326
--             ),
--             32129
--         ))/50)*50 AS distance
-- FROM indego.station_statuses
-- ORDER BY 
--     distance DESC
-- LIMIT 1;

-- Question 14
-- SELECT 
-- 	id,
-- 	name,
-- 	ROUND(ST_Distance(
-- 		geom_32129, 
-- 		ST_Transform(
--             ST_SetSRID(
--                 ST_Makepoint(-75.192584, 39.952415), 
--                 4326
--             ),
--             32129
--         ))/50)*50 AS distance
-- FROM indego.station_statuses
-- ORDER BY 
--     distance ASC
-- LIMIT 1;





