/*
    What is the longest duration trip across the two quarters?

    Your result should have a single row with a single column named max_duration.
*/

-- Enter your SQL query here
WITH all_trips AS (
    SELECT duration
    FROM indego_trips_2021_q3
    UNION ALL
    SELECT duration
    FROM indego_trips_2022_q3
)

SELECT MAX(CAST(duration AS numeric)) AS max_duration
FROM all_trips;
