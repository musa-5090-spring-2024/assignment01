/*
    How many trips in each quarter were shorter than 10 minutes?

    Your result should have two records with three columns, one for the year
    (named `trip_year`), one for the quarter (named `trip_quarter`), and one for
    the number of trips (named `num_trips`).
*/

-- Enter your SQL query here
SELECT
    CAST(2021 AS TEXT) AS trip_year,
    CAST(3 AS TEXT) AS trip_quarter,
    COUNT(*) AS num_trips
FROM
    indego.trips_2021_q3
WHERE
    EXTRACT(EPOCH FROM (end_time - start_time)) / 60 < 10

UNION ALL

SELECT
    CAST(2022 AS TEXT) AS trip_year,
    CAST(3 AS TEXT) AS trip_quarter,
    COUNT(*) AS num_trips
FROM
    indego.trips_2022_q3
WHERE
    EXTRACT(EPOCH FROM (end_time - start_time)) / 60 < 10;
