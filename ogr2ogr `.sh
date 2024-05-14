ogr2ogr `
  -f "PostgreSQL" `
  -nln "indego.stations" `
  -lco "OVERWRITE=yes" `
  -lco "GEOM_TYPE=geography" `
  -lco "GEOMETRY_NAME=the_geog" `
  PG:"host=localhost port=5432 dbname=assignment01 user=postgres password=marissa" `
  "data\stations.geojson"

 
