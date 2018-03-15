#!/bin/bash
docker kill geoserver
docker rm geoserver
docker kill postgis
docker rm postgis

#$DATA_DIR=~/geoserver_data
export DATA_DIR=/media/arawlins/Backups/DataSources/geoserver_data
if [ ! -d $DATA_DIR ]
then
    mkdir -p $DATA_DIR
fi

docker run --name "postgis" -p 5432:5432 -d -t kartoza/postgis:9.4-2.1

docker run \
	--name=geoserver \
	--link postgis:postgis \
        -v $DATA_DIR:/opt/geoserver/data_dir \
	-p 9090:8080 \
	-d \
	-t anthonyrawlinsuom/lfmc-geoserver
