/*
    What is the longest duration trip across the two quarters?

    Your result should have a single row with a single column named max_duration.
*/

-- Enter your SQL query here
WITH t2 AS (
    SELECT MAX(duration) AS max22
    FROM indego.trips_2022_q3
)

SELECT GREATEST(t1.max21, t2.max22) AS max_duration
FROM (
    SELECT MAX(duration) AS max21
    FROM indego.trips_2021_q3
) AS t1 CROSS JOIN t2;
