/*
    What is the longest duration trip across the two quarters?

    Your result should have a single row with a single column named max_duration.
*/

-- Enter your SQL query here
select max(duration::integer) as max_duration from
    (
        select * from indego.trips_2022_q3
        union
        select * from indego.trips_2021_q3
    );
