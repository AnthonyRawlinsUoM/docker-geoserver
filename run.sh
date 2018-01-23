#!/bin/bash
docker kill geoserver
docker rm geoserver
docker kill postgis
docker rm postgis

DATA_DIR=~/geoserver_data
if [ ! -d $DATA_DIR ]
then
    mkdir -p $DATA_DIR
fi

docker run --name "postgis" -d -t kartoza/postgis:9.4-2.1

docker run \
	--name=geoserver \
	--link postgis:postgis \
        -v $DATA_DIR:/opt/geoserver/data_dir \
	-p 8080:8080 \
	-d \
	-t anthonyrawlinsuom/lfmc-geoserver
