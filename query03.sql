-- Active: 1708533339248@@127.0.0.1@5432@assignment01
/*
    What is the average duration of a trip for 2021?

    Your results should have a single record with a single field named
    `avg_duration`. Round to two decimal places.
*/

SELECT AVG(duration) AS avg_duration
FROM indego.trips_2021_q3;
