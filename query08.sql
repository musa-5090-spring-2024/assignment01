/*
    Give the five most popular starting stations across all years between 7am
    and 9:59am.

    Your result should have 5 records with three columns, one for the station id
    (named `station_id`), one for the point geography of the station (named
    `station_geog`), and one for the number of trips that started at that
    station (named `num_trips`).
*/

-- Enter your SQL query here
SELECT start_station AS station_id, COUNT(start_station) AS num_trips, st_setsrid(st_makepoint(start_lon::FLOAT, start_lat::FLOAT), 4326) AS station_geog
FROM (
    (SELECT start_station, start_lon, start_lat
     FROM trips_2021_q3
     WHERE EXTRACT(HOUR FROM start_time::timestamp) >= 7 AND EXTRACT(HOUR FROM start_time::timestamp) < 10)
    UNION ALL
    (SELECT start_station, start_lon, start_lat
     FROM trips_2022_q3
     WHERE EXTRACT(HOUR FROM start_time::timestamp) >= 7 AND EXTRACT(HOUR FROM start_time::timestamp) < 10)
) AS subquery
GROUP BY start_station, start_lon, start_lat
ORDER BY num_trips DESC
LIMIT 5;
/* result:
"3032"	1828	"0101000020E6100000E8305F5E80CB52C0B96DDFA3FEF84340"
"3102"	1689	"0101000020E6100000963E74417DCB52C0E4F736FDD9FB4340"
"3012"	1614	"0101000020E6100000A1478C9E5BCB52C0CFF4126399F84340"
"3066"	1529	"0101000020E6100000ED66463F1ACB52C0A2629CBF09F94340"
"3007"	1434	"0101000020E6100000D5AF743E3CCA52C05610035DFBF84340"
*/

/*
    Hint: Use the `EXTRACT` function to get the hour of the day from the
    timestamp.
*/
