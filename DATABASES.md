## Loading data to databases


For the geojson, I was able to get it to work with:
1. downloading it as a geojson, not a json
2. navigating in command line to the directory in which it was stored
3. running the following command: `sudo -u postgres ogr2ogr -f "PostgreSQL" PG:"dbname=musa5090 user=postgres" phl.geojson -nln indego.station_statuses`