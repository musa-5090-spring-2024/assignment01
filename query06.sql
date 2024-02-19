/*
    How many trips in each quarter were shorter than 10 minutes?

    Your result should have two records with three columns, one for the year
    (named `trip_year`), one for the quarter (named `trip_quarter`), and one for
    the number of trips (named `num_trips`).
*/

-- Enter your SQL query here
SELECT '2021' AS trip_year, 'Q3' AS trip_quarter, COUNT(*) AS num_trips
FROM trips_2021_q3
WHERE duration::numeric < 10
UNION 
SELECT '2022' AS trip_year, 'Q3' AS trip_quarter, COUNT(*) AS num_trips
FROM trips_2022_q3
WHERE duration::numeric < 10
/* result: 2021 has 124528 trips less than 10 mintues, 2022 has 137372 trips less than 10 mintues.
*/
