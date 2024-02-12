/*
    How many trips started on one day and ended on a different day?

    Your result should have one column named trip_year, one column named
    trip_quarter, and one column named num_trips.
*/

-- Enter your SQL query here
SELECT trip_year, trip_quarter, COUNT(*) AS num_trips
FROM (
    SELECT
        EXTRACT(YEAR FROM start_time) AS trip_year,
        'Q3' AS trip_quarter,
        start_time::DATE AS start_date,
        end_time::DATE AS end_date
    FROM indego.trips_2021_q3
    UNION ALL
    SELECT
        EXTRACT(YEAR FROM start_time) AS trip_year,
        'Q3' AS trip_quarter,
        start_time::DATE AS start_date,
        end_time::DATE AS end_date
    FROM indego.trips_2022_q3
) AS combined_trips
WHERE start_date != end_date
GROUP BY trip_year, trip_quarter;

/*

    Hint 1: when you cast a TIMESTAMP to a DATE the time component of the value is simply stripped off

    Hint 2: Years, quarters, and other parts of DATEs or TIMESTAMPs can be retrieved from a TIMESTAMP using the
    [EXTRACT](https://www.postgresql.org/docs/12/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT)
    function.
*/
