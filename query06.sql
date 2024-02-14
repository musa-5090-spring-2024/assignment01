/*
    How many trips in each quarter were shorter than 10 minutes?

    Your result should have two records with three columns, one for the year
    (named `trip_year`), one for the quarter (named `trip_quarter`), and one for
    the number of trips (named `num_trips`).
*/
SELECT
    yr AS trip_year,
    trip_quarter,
    num_trips
FROM
    (
        SELECT
            2021 AS yr,
            3 AS trip_quarter,
            COUNT(*) AS num_trips
        FROM indego.trips_2021_q3
        WHERE duration::integer < 10
    )
UNION
(
    SELECT
        2022 AS yr,
        3 AS trip_quarter,
       	COUNT(*) AS num_trips
    FROM indego.trips_2022_q3
    WHERE duration::integer < 10
);
