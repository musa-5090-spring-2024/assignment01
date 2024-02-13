/*
    How many stations are within 1km of Meyerson Hall?

    Your query should have a single record with a single attribute, the number
    of stations (num_stations).
*/

-- Enter your SQL query here
select count(*) as num_stations
from (
    select
        st_distance(
                st_transform(geog::geometry, 32129),
                st_transform(
                    st_setsrid(
                        st_makepoint(-75.192584,39.952415), 4326),
                    32129
                    )
                ) / 1000 as avg_distance_km
    from indego.station_statuses
) as subquery
where avg_distance_km <= 1;
