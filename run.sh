#!/bin/bash
docker kill geoserver
docker rm geoserver
docker kill postgis
docker rm postgis

#$DATA_DIR=~/geoserver_data

if [ ! -d $LFMC_GEOSERVER_DATA_DIR ]
then
    mkdir -p $LFMC_GEOSERVER_DATA_DIR
fi

docker run --name "postgis" -p 5432:5432 -d -t kartoza/postgis:9.4-2.1

docker run \
	--name=geoserver \
	--link postgis:postgis \
        -v $LFMC_GEOSERVER_DATA_DIR:/opt/geoserver/data_dir \
	-p 8080:8080 \
	-d \
	-t anthonyrawlinsuom/lfmc-geoserver
