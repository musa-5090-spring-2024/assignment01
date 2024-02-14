/*
    What is the longest duration trip across the two quarters?

    Your result should have a single row with a single column named max_duration.
*/

-- Enter your SQL query here

WITH year_2021 AS (
    SELECT MAX(duration) AS trip21
    FROM indego.trips_2021_q3
)

SELECT GREATEST(year_2021.trip21, year_2022.trip22) AS max_duration
FROM (
    SELECT MAX(duration) AS trip22
    FROM indego.trips_2022_q3
) AS year_2022 CROSS JOIN year_2021;
