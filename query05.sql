/*
    What is the longest duration trip across the two quarters?

    Your result should have a single row with a single column named max_duration.
*/

SELECT MAX(duration) AS longest_duration
FROM (
    SELECT duration FROM indego.trips_2021_q3
    UNION
    SELECT duration FROM indego.trips_2022_q3
) AS combined_tables;

