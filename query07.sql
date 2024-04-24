/*
    How many trips started on one day and ended on a different day?

    Your result should have one column named trip_year, one column named
    trip_quarter, and one column named num_trips.
*/

-- Enter your SQL query here
WITH TripCounts AS (
    SELECT 
        EXTRACT(YEAR FROM start_time) AS start_year, 
        EXTRACT(YEAR FROM end_time) AS end_year,
        COUNT(*) AS num_trips 
    FROM 
        indego.trips_2021_q3 
    WHERE
        end_time <> start_time    
    GROUP BY 
        EXTRACT(YEAR FROM start_time),
        EXTRACT(YEAR FROM end_time)
    UNION ALL
    SELECT 
        EXTRACT(YEAR FROM start_time) AS start_year, 
        EXTRACT(YEAR FROM end_time) AS end_year,
        COUNT(*) AS num_trips 
    FROM 
        indego.trips_2022_q3 
    WHERE
       end_time <> start_time   
    GROUP BY 
        EXTRACT(YEAR FROM start_time),
        EXTRACT(YEAR FROM end_time)
)
SELECT start_year AS trip_year,
    3 AS trip_quarter,
    num_trips
FROM TripCounts;

/*

    Hint 1: when you cast a TIMESTAMP to a DATE the time component of the value is simply stripped off

    Hint 2: Years, quarters, and other parts of DATEs or TIMESTAMPs can be retrieved from a TIMESTAMP using the
    [EXTRACT](https://www.postgresql.org/docs/12/functions-datetime.html#FUNCTIONS-DATETIME-EXTRACT)
    function.
*/
