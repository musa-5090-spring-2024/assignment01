-- Active: 1708112526321@@127.0.0.1@5432@homework01@indego
/*
    Example: How many bike trips in Q3 2021. Name the resulting column
    num_trips.
*/

-- Enter your SQL query here
select count(*) as num_trips
from indego.trips_2021_q3

/*
    There were a total of 300,432 trips in the num_trips column.
*/