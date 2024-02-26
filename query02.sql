/*
    What is the percent change in trips in Q3 2022 as compared to Q3 2021?

    Using only the tables from Q3 2021 and Q3 2022 (i.e. not directly using the
    number calculated in the previous question), find the percent change in the
    number of trips in Q3 2022 as compared to 2021. Round your answer to two
    decimal places and name the resulting field `perc_change`.

    Remember you can do calculations in the select clause.
*/

-- Enter your SQL query here

WITH trips_2022 AS (
    SELECT COUNT(*) AS cnt_2022
    FROM indego_trips_2022_q3
),

trips_2021 AS (
    SELECT COUNT(*) AS cnt_2021
    FROM indego_trips_2021_q3
)

SELECT 100 * (trips_2022.cnt_2022 - trips_2021.cnt_2021) / trips_2021.cnt_2021 AS perc_change
FROM trips_2022, trips_2021;



/*
    If you want to get fancier here, you can cast the result to a string and
    concatenate a '%' to the end. For example:

        (10 + 3.2)::text || '%' AS perc_change

    This uses the type casting (number to string) and string concatenation
    operator (`||`, double pipes) that's essentially a `+` for strings.
*/
