/*
    How many trips started on one day and ended on a different day?

    Your result should have one column named trip_year, one column named
    trip_quarter, and one column named num_trips.
*/

-- Enter your SQL query here
SELECT '2021' AS trip_year, 'Q3' AS trip_quarter, COUNT(*) AS num_trips
FROM trips_2021_q3
WHERE EXTRACT(DAY FROM CAST(start_time AS DATE)) != EXTRACT(DAY FROM CAST(end_time AS DATE))
UNION
SELECT '2022' AS trip_year, 'Q3' AS trip_quarter, COUNT(*) AS num_trips
FROM trips_2022_q3
WHERE EXTRACT(DAY FROM CAST(start_time AS DATE)) != EXTRACT(DAY FROM CAST(end_time AS DATE));
/* result: In 2021, there are 2301 trips ended on a different day. In 2022, there are 2060 trips ended on a different day.
*/



/*

    Hint 1: when you cast a TIMESTAMP to a DATE the time component of the value is simply stripped off

    Hint 2: Years, quarters, and other parts of DATEs or TIMESTAMPs can be retrieved from a TIMESTAMP using the
    [EXTRACT](https://www.postgresql.org/docs/12/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT)
    function.
*/
