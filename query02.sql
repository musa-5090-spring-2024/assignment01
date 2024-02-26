/*
    What is the percent change in trips in Q3 2022 as compared to Q3 2021?

    Using only the tables from Q3 2021 and Q3 2022 (i.e. not directly using the
    number calculated in the previous question), find the percent change in the
    number of trips in Q3 2022 as compared to 2021. Round your answer to two
    decimal places and name the resulting field `perc_change`.

    Remember you can do calculations in the select clause.
*/

-- Enter your SQL query here
WITH num_trips_2021 as (
	SELECT COUNT(*) AS num_trips_2021
	FROM indego.trips_2021_q3
	),
num_trips_2022 as(
	SELECT COUNT(*) AS num_trips_2022
	FROM indego.trips_2022_q3
	)
	
SELECT ((num_trips_2022.num_trips_2022 - num_trips_2021.num_trips_2021) * 100.0/ num_trips_2021.num_trips_2021)
FROM num_trips_2021
CROSS JOIN num_trips_2022;


/*
    If you want to get fancier here, you can cast the result to a string and
    concatenate a '%' to the end. For example:

        (10 + 3.2)::text || '%' AS perc_change

    This uses the type casting (number to string) and string concatenation
    operator (`||`, double pipes) that's essentially a `+` for strings.
*/
