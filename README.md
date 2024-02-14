# Assignment 01

## Datasets

* Indego Bikeshare station status data
* Indego Trip data
  - Q3 2021
  - Q3 2022

All data is available from [Indego's Data site](https://www.rideindego.com/about/data/).

For any questions that refer to Meyerson Hall, use latitude `39.952415` and longitude `-75.192584` as the coordinates for the building.

Load all three datasets into a PostgreSQL database schema named `indego` (the name of your database is not important). Your schema should have the following structure:

> This structure is important -- particularly the **table names** and the **lowercase field names**; if your queries are not built to work with this structure then _your assignment will fail the tests_.

* **Table**: `indego.trips_2021_q3`  
  **Fields**:
    * `trip_id TEXT`
    * `duration INTEGER`
    * `start_time TIMESTAMP`
    * `end_time TIMESTAMP`
    * `start_station TEXT`
    * `start_lat FLOAT`
    * `start_lon FLOAT`
    * `end_station TEXT`
    * `end_lat FLOAT`
    * `end_lon FLOAT`
    * `bike_id TEXT`
    * `plan_duration INTEGER`
    * `trip_route_category TEXT`
    * `passholder_type TEXT`
    * `bike_type TEXT`

* **Table**: `indego.trips_2022_q3`  
  **Fields**: (same as above)

* **Table**: `indego.station_statuses`  
  **Fields** (at a minimum -- there may be many more):
    * `id INTEGER`
    * `name TEXT` (or `CHARACTER VARYING`)
    * `geog GEOGRAPHY`
    * ...

## Questions

Write a query to answer each of the questions below.
* Your queries should produce results in the format specified.
* Write your query in a SQL file corresponding to the question number (e.g. a file named _query06.sql_ for the answer to question #6).
* Each SQL file should contain a single `SELECT` query.
* Any SQL that does things other than retrieve data (e.g. SQL that creates indexes or update columns) should be in the _db_structure.sql_ file.
* Some questions include a request for you to discuss your methods. Update this README file with your answers in the appropriate place.


1. [How many bike trips in Q3 2021?](query01.sql)

    This file is filled out for you, as an example.

    ```SQL
    select count(*)
    from indego.trips_2021_q3
    ```

    **Result:** 300,432

2. [What is the percent change in trips in Q3 2022 as compared to Q3 2021?](query02.sql)

3. [What is the average duration of a trip for 2021?](query03.sql)

4. [What is the average duration of a trip for 2022?](query04.sql)

5. [What is the longest duration trip across the two quarters?](query05.sql)

    _Why are there so many trips of this duration?_

    **Answer:
After conducting a query, it was found that there are 1,241 trips within the dataset that each have a duration of 1440 minutes, equivalent to 24 hours. This analysis, which took into account variables such as duration, start station, end station, plan duration, bike type, and passholder type, sheds light on various user behaviors and systemic aspects of the bike-sharing program.

One significant insight suggests that bikes involved in these 24-hour trips might be either lost or stolen. This is indicated by instances where the end station's ID is labeled as 3000, whereas valid station IDs begin from 3005, implying improper return of these bikes. The system seems to utilize a 24-hour duration marker as an indicator for bikes that are not returned within the expected timeframe, marking them for further investigation or user confirmation regarding their status.

Moreover, the phenomenon of whole-day rentals emerges as another factor. Users opting for bikes for an entire day for leisure, tourism, or other purposes often return them just before the 24-hour threshold to avoid extra charges. This pattern is particularly observable in trips that begin and end at the same location, like the Pennsylvania Convention Center, suggesting a tourist demographic that prefers to explore the vicinity at their leisure. **

6. [How many trips in each quarter were shorter than 10 minutes?](query06.sql)

7. [How many trips started on one day and ended on a different day?](query07.sql)

8. [Give the five most popular starting stations across all years between 7am and 9:59am.](query08.sql)

    _Hint: Use the `EXTRACT` function to get the hour of the day from the timestamp._

9. [List all the passholder types and number of trips for each across all years.](query09.sql)

10. [Using the station status dataset, find the distance in meters of each station from Meyerson Hall.](query10.sql)

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)

12. [How many stations are within 1km of Meyerson Hall?](query12.sql)

13. [Which station is furthest from Meyerson Hall?](query13.sql)

14. [Which station is closest to Meyerson Hall?](query14.sql)
