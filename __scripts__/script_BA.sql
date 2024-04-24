# Load 2021 & 2022 trip data
PGPASSWORD=postgres psql \
  -h localhost \
  -p 5432 \
  -U brookeacosta \
  -d homework01 \
  -c "\copy indego.trips_2021_q3 FROM '/Users/brookeacosta/Desktop/musa 509/Homework/cloud_assignment01/data/indego-trips-2021-q3.csv' DELIMITER ',' CSV HEADER;"

PGPASSWORD=postgres psql \
  -h localhost \
  -p 5432 \
  -U brookeacosta \
  -d homework01 \
  -c "\copy indego.trips_2022_q3 FROM '/Users/brookeacosta/Desktop/musa 509/Homework/cloud_assignment01/data/indego-trips-2022-q3.csv' DELIMITER ',' CSV HEADER;"

  # Download and load station data into database
curl -L http://www.rideindego.com/stations/json/ > ${DATADIR}/indego-station-statuses.geojson
ogr2ogr \
  -f "PostgreSQL" \
  -nln "indego.station_statuses" \
  -lco "OVERWRITE=yes" \
  -lco "GEOM_TYPE=geography" \
  -lco "GEOMETRY_NAME=geog" \
  PG:"host=localhost port=5432 dbname=homework01 user=brookeacosta password=postgres" \
  "/Users/brookeacosta/Desktop/musa 509/Homework/cloud_assignment01/data/indego-station-statuses.geojson"