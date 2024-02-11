/*
    How many trips in each quarter were shorter than 10 minutes?

    Your result should have two records with three columns, one for the year
    (named `trip_year`), one for the quarter (named `trip_quarter`), and one for
    the number of trips (named `num_trips`).
*/

-- Enter your SQL query here
WITH TripCategories AS (
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
    GROUP BY trip_year, trip_quarter
)

SELECT
    trip_year,
    trip_quarter,
    num_trips
FROM TripCategories;

-- Result:
-- Year 2021 Q3: 124,528
-- Year 2022 Q3: 137,372