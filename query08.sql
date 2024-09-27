/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here

-- Alter the column 'id' of table 'indego.indego_station_statuses' from integer to text 
--ALTER TABLE indego.indego_station_statuses
--ALTER COLUMN id TYPE TEXT;

-- Add a new geography column named 'geog_3857' to your table
--ALTER TABLE indego.indego_station_statuses
--    ADD COLUMN geom_3857 geometry;

-- Update the new column with transformed geography data
--UPDATE indego.indego_station_statuses SET 
--    geom_3857 = st_transform(geog::geometry, 3857);

WITH PopTrip AS (
    SELECT
        t.start_station AS station_id,
        s.geog AS station_geog,
        COUNT(*) AS num_trips
    FROM indego.trips_2021_q3 t
    JOIN indego.indego_station_statuses s ON t.start_station::text = s.id
    WHERE EXTRACT(HOUR FROM t.start_time) >= 7 AND EXTRACT(HOUR FROM t.start_time) < 10
    GROUP BY t.start_station, s.geog

    UNION ALL

    SELECT
        t.start_station AS station_id,
        s.geog AS station_geog,
        COUNT(*) AS num_trips
    FROM indego.trips_2022_q3 t
    JOIN indego.indego_station_statuses s ON t.start_station::text = s.id
    WHERE EXTRACT(HOUR FROM t.start_time) >= 7 AND EXTRACT(HOUR FROM t.start_time) < 10
    GROUP BY t.start_station, s.geog
)

SELECT
    station_id,
    station_geog,
    SUM(num_trips) AS num_trips
FROM PopTrip
GROUP BY station_id, station_geog
ORDER BY num_trips DESC
LIMIT 5;
/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/

-- Result:
-- Station #3032: 1,828 trips
-- Station #3102: 1,689 trips
-- Station #3012: 1,614 trips
-- Station #3066: 1,529 trips
-- Station #3007: 1,434 trips