/*
    List all the passholder types and number of trips for each across all years.

    In other words, in one query, give a list of all `passholder_type` options
    and the number of trips taken by `passholder_type`. Your results should have
    two columns: `passholder_type` and `num_trips`.
*/

-- Enter your SQL query here
SELECT passholder_type, COUNT(*) AS num_trips
FROM(SELECT *
FROM trips_2021_q3
UNION 
SELECT *
FROM trips_2022_q3)
GROUP BY passholder_type
ORDER BY num_trips;
/* result "Walk-up"	2
          "NULL"	43
          "Day Pass"	61659
          "Indego365"	109251
          "Indego30"	441856
*/
