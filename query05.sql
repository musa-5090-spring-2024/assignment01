/*
    What is the longest duration trip across the two quarters?

    Your result should have a single row with a single column named max_duration.
*/

-- Enter your SQL query here

WITH t1 AS (
    SELECT duration FROM indego.trips_2021_q3
    UNION
    SELECT duration FROM indego.trips_2022_q3
)

SELECT MAX(duration) AS max_duration
FROM t1
