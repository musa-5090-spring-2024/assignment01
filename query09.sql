/*
    List all the passholder types and number of trips for each across all years.

    In other words, in one query, give a list of all `passholder_type` options
    and the number of trips taken by `passholder_type`. Your results should have
    two columns: `passholder_type` and `num_trips`.
*/

-- Enter your SQL query here

WITH t1 AS (
    SELECT
        passholder_type,
        trip_id
    FROM indego.trips_2021_q3
    UNION
    SELECT
        passholder_type,
        trip_id
    FROM indego.trips_2022_q3
)

SELECT
    passholder_type,
    COUNT(*) AS num_trips
FROM t1
GROUP BY passholder_type
