/*
    What is the percent change in trips in Q3 2022 as compared to Q3 2021?

    Using only the tables from Q3 2021 and Q3 2022 (i.e. not directly using the
    number calculated in the previous question), find the percent change in the
    number of trips in Q3 2022 as compared to 2021. Round your answer to two
    decimal places and name the resulting field `perc_change`.

    Remember you can do calculations in the select clause.
*/

-- Enter your SQL query here

WITH TripCounts AS (
    SELECT 
        EXTRACT(YEAR FROM start_time) AS start_year, 
        COUNT(*) AS num_trips 
    FROM 
        indego.trips_2021_q3 
    GROUP BY 
        EXTRACT(YEAR FROM start_time)
    UNION ALL
    SELECT 
        EXTRACT(YEAR FROM start_time) AS start_year, 
        COUNT(*) AS num_trips 
    FROM 
        indego.trips_2022_q3 
    GROUP BY 
        EXTRACT(YEAR FROM start_time)
)
SELECT 
    T1.start_year AS Year1, 
    T2.start_year AS Year2, 
    T1.num_trips AS Trips_Year1, 
    T2.num_trips AS Trips_Year2,
    ROUND(((T2.num_trips - T1.num_trips) * 100.0 / T1.num_trips), 2) ::text || '%' AS perc_change
FROM 
    TripCounts T1, TripCounts T2
WHERE 
    T1.start_year < T2.start_year;



/*
    If you want to get fancier here, you can cast the result to a string and
    concatenate a '%' to the end. For example:

        (10 + 3.2)::text || '%' AS perc_change

    This uses the type casting (number to string) and string concatenation
    operator (`||`, double pipes) that's essentially a `+` for strings.
*/
