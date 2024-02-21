#!/bin/env bash

set -e
set -x

SCRIPTDIR=$(readlink -f $(dirname $0))
DATADIR=$(readlink -f $(dirname $0)/../__data__)
mkdir -p ${DATADIR}

# Create a configuration file for the database connection
cat << EOF > ${SCRIPTDIR}/../.env
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_NAME=musa_509
POSTGRES_USER=postgres
POSTGRES_PASS=postgres
EOF

# Download and unzip trip data
curl -L https://bicycletransit.wpenginepowered.com/wp-content/uploads/2022/12/indego-trips-2022-q3.zip > ${DATADIR}/indego-trips-2022-q3.zip
unzip -o ${DATADIR}/indego-trips-2022-q3.zip -d ${DATADIR}

curl -L https://bicycletransit.wpenginepowered.com/wp-content/uploads/2021/10/indego-trips-2021-q3.zip > ${DATADIR}/indego-trips-2021-q3.zip
unzip -o ${DATADIR}/indego-trips-2021-q3.zip -d ${DATADIR}

# Create database and initialize table structure
PGPASSWORD=postgres createdb \
  -h localhost \
  -p 5432 \
  -U postgres \
  musa_509
PGPASSWORD=postgres psql \
  -h localhost \
  -p 5432 \
  -U postgres \
  -d musa_509 \
  -f "${SCRIPTDIR}/create_trip_tables.sql"

# Load trip data into database
PGPASSWORD=postgres psql \
  -h localhost \
  -p 5432 \
  -U postgres \
  -d musa509assign_1 \
  -c "\copy indego.trips_2021_q3 FROM 'indego-trips-2021-q3/indego-trips-2021-q3.csv' DELIMITER ',' CSV HEADER;"
PGPASSWORD=postgres psql \
  -h localhost \
  -p 5432 \
  -U postgres \
  -d musa509assign_1 \
  -c "\copy indego.trips_2022_q3 FROM 'indego-trips-2022-q3.csv' DELIMITER ',' CSV HEADER;"

# Download and load station data into database
curl -L http://www.rideindego.com/stations/json/ > indego-station-statuses.geojson
ogr2ogr \
  -f "PostgreSQL" \
  -nln "indego.station_statuses" \
  -lco "OVERWRITE=yes" \
  -lco "GEOM_TYPE=geography" \
  -lco "GEOMETRY_NAME=geog" \
  PG:"host=localhost port=5432 dbname=musa509assign_1 user=avani password=sqlpassword" \
  indego-station-statuses.geojson
