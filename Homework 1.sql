--Query 3
SELECT AVG(duration) FROM indego.trips_2021_q3;

--Query 4
SELECT AVG(duration) FROM indego.trips_2022_q3;

--Query 5
SELECT MAX(duration) FROM indego.trips_2021_q3;
SELECT MAX(duration) FROM indego.trips_2022_q3;

--Query 9
--(2021)
SELECT
    passholder_type,
    COUNT(*) AS num_trips
FROM
   indego.trips_2021_q3
GROUP BY
    passholder_type
ORDER BY
    num_trips DESC;

--(2022)
SELECT
    passholder_type,
    COUNT(*) AS num_trips
FROM
   indego.trips_2022_q3
GROUP BY
    passholder_type
ORDER BY
    num_trips DESC;