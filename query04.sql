/*
    What is the average duration of a trip for 2022?

    Your results should have a single record with a single field named
    `avg_duration`. Round to two decimal places.
*/

-- Enter your SQL query here
SELECT AVG(duration::numeric) AS avg_duration_22
FROM trips_2022_q3;
/* result: 17.8782600622961211
*/
