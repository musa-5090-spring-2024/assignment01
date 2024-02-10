/*
    Using the station status dataset, find the distance in meters of each
    station from Meyerson Hall. Use latitude 39.952415 and longitude -75.192584
    as the coordinates for Meyerson Hall.

    Your results should have three columns: station_id, station_geog, and
    distance. Round to the nearest fifty meters.
*/

-- Enter your SQL query here

select
    id as station_id,
    geog as station_geog,
    floor(st_distance(
            st_transform(geog::geometry, 32129),
            st_transform(
                st_setsrid(
                    st_makepoint(-75.192584,39.952415), 4326),
                32129
                )
            ) / 50) * 50 as distance
from indego.station_statuses
order by distance desc;