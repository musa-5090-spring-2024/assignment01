/*
    How many trips in each quarter were shorter than 10 minutes?

    Your result should have two records with three columns, one for the year
    (named `trip_year`), one for the quarter (named `trip_quarter`), and one for
    the number of trips (named `num_trips`).
*/

-- Enter your SQL query here

SELECT
    EXTRACT(YEAR FROM start_time) AS trip_year,
    EXTRACT(QUARTER FROM start_time) AS trip_quarter,
    COUNT(*) AS num_trips
FROM indego.trips_2021_q3
WHERE duration < 10
GROUP BY trip_year, trip_quarter
UNION
SELECT
    EXTRACT(YEAR FROM start_time) AS trip_year,
    EXTRACT(QUARTER FROM start_time) AS trip_quarter,
    COUNT(*) AS num_trips
FROM indego.trips_2022_q3
WHERE duration < 10
GROUP BY trip_year, trip_quarter;

-- DROP TABLE IF EXISTS indego.short_travel;
-- CREATE TABLE indego.short_travel (
--     trip_year INTEGER,
--     trip_quarter INTEGER,
--     num_trips INTEGER
-- );

-- WITH year_2021 AS (
--     SELECT COUNT(*) AS trip21
--     FROM indego.trips_2021_q3
--     WHERE duration < 10
-- ), year_2022 AS (
--     SELECT COUNT(*) AS trip22
--     FROM indego.trips_2022_q3
--     WHERE duration < 10
-- )

-- INSERT INTO indego.short_travel (trip_year, trip_quarter, num_trips)
-- VALUES
-- (2021, 3, (SELECT trip21 FROM year_2021)),
-- (2022, 3, (SELECT trip22 FROM year_2022));

-- SELECT *
-- FROM indego.short_travel;
