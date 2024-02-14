/*
    How many trips in each quarter were shorter than 10 minutes?

    Your result should have two records with three columns, one for the year
    (named `trip_year`), one for the quarter (named `trip_quarter`), and one for
    the number of trips (named `num_trips`).

Answer:
2021: 124668
2022: 137401
*/

-- Enter your SQL query here
SELECT
    (SELECT COUNT(*) 
     FROM indego.trips_2021_q3
     WHERE EXTRACT(EPOCH FROM (end_time - start_time)) / 60 < 10) AS trips_shorter_than_10_minutes_21,
    (SELECT COUNT(*)
     FROM indego.trips_2022_q3
     WHERE EXTRACT(EPOCH FROM (end_time - start_time)) / 60 < 10) AS trips_shorter_than_10_minutes_22;
