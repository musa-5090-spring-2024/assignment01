/*
    What is the longest duration trip across the two quarters?

    Your result should have a single row with a single column named max_duration.
*/

-- Enter your SQL query here

WITH max_duration_2021 as (
	SELECT MAX(duration) AS max_duration_2021
	FROM indego.trips_2021_q3
	),
max_duration_2022 as(
	SELECT MAX(duration) AS max_duration_2022
	FROM indego.trips_2022_q3
	)

SELECT GREATEST(max_duration_2021.max_duration_2021, max_duration_2022.max_duration_2022) AS max_duration
FROM max_duration_2021
CROSS JOIN max_duration_2022
