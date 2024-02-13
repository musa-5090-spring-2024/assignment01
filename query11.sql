/*
    What is the average distance (rounded to the nearest km) of all stations
    from Meyerson Hall? Your result should have a single record with a single
    column named avg_distance_km.
*/

-- Enter your SQL query here
select
    round(avg(st_distance(
            st_transform(geog::geometry, 32129),
            st_transform(
                st_setsrid(
                    st_makepoint(-75.192584,39.952415), 4326),
                32129
                )
            ) / 1000)) as avg_distance_km
from indego.station_statuses
