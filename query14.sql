/*
    Which station is closest to Meyerson Hall?

    Your query should return only one line, and only give the station id
    (station_id), station name (station_name), and distance (distance) from
    Meyerson Hall, rounded to the nearest 50 meters.
*/

-- Enter your SQL query here

select
    id as station_id,
    name as station_name,
    round(
            st_distance(
                st_transform(geog::geometry, 32129),
                st_transform(
                    st_setsrid(
                        st_makepoint(-75.192584,39.952415), 4326),
                    32129
                    )
                ) / 50) * 50 as distance
from indego.station_statuses
order by distance asc
limit 1;