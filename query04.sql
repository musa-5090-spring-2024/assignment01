/*
    What is the average duration of a trip for 2022?

    Your results should have a single record with a single field named
    `avg_duration`. Round to two decimal places.

Answer: 18.78

*/

-- Enter your SQL query here
SELECT
    ROUND(AVG(EXTRACT(EPOCH FROM (end_time - start_time)) / 60), 2) AS avg_duration_minutes
FROM
    indego.trips_2022_q3;