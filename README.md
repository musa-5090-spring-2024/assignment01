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

- 300,432

2. [What is the percent change in trips in Q3 2022 as compared to Q3 2021?](query02.sql)
- 3.98%

3. [What is the average duration of a trip for 2021?](query03.sql)
- 18.86min

4. [What is the average duration of a trip for 2022?](query04.sql)
- 17.88min

5. [What is the longest duration trip across the two quarters?](query05.sql)

    _Why are there so many trips of this duration?_

    - The longest duration is **1,440 min**. It might be a result that some of the bike riders forgot to turn off and lock the bike. So the trip duration lasts for 24 hours.

6. [How many trips in each quarter were shorter than 10 minutes?](query06.sql)
- Year 2021 Q3: 124,528
- Year 2022 Q3: 137,372

7. [How many trips started on one day and ended on a different day?](query07.sql)
- Year 2021 Q3: 2,301
- Year 2022 Q3: 2,060

8. [Give the five most popular starting stations across all years between 7am and 9:59am.](query08.sql)

    _Hint: Use the `EXTRACT` function to get the hour of the day from the timestamp._
   - Station #3032: 1,828 trips
   - Station #3102: 1,689 trips
   - Station #3012: 1,614 trips
   - Station #3066: 1,529 trips
   - Station #3007: 1,434 trips

9. [List all the passholder types and number of trips for each across all years.](query09.sql)
- Day Pass: 61,659
- Indego30: 441,856
- Indego365: 109,251
- Walk-up: 2
- Null: 43

10. [Using the station status dataset, find the distance in meters of each station from Meyerson Hall.](query10.sql)
- "\outcome\query10_result.csv"

11. [What is the average distance (in meters) of all stations from Meyerson Hall?](query11.sql)
- 3km

12. [How many stations are within 1km of Meyerson Hall?](query12.sql)
- 16

13. [Which station is furthest from Meyerson Hall?](query13.sql)
- station_id = 3323
- station_name = Manayunk Bridge
- distance = 8900m

14. [Which station is closest to Meyerson Hall?](query14.sql)
- station_id = 3208
- station_name = 34TH & Spruce
- distance = 200m