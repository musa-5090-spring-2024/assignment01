/*
    What is the longest duration trip across the two quarters?

    Your result should have a single row with a single column named max_duration.
*/

-- Enter your SQL query here
SELECT
    MAX(duration_minutes) AS max_duration
FROM
    (
        SELECT
            EXTRACT(EPOCH FROM (end_time - start_time)) / 60 AS duration_minutes
        FROM
            indego.trips_2021_q3
        UNION ALL
        SELECT
            EXTRACT(EPOCH FROM (end_time - start_time)) / 60 AS duration_minutes
        FROM
            indego.trips_2022_q3
    ) AS combined_durations;
