#!/bin/bash

set -e

pushd $(dirname $0)/..

xhost +

docker run \
    --rm \
    -it \
    --name qgis \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $PWD/.logs:/mounted-logs:rw \
    -e DISPLAY=unix$DISPLAY \
    -e CPL_DEBUG=ON \
    -e CPL_LOG=/mounted-logs/cpl.log \
    -e CPL_LOG_ERRORS=ON \
    qgis/qgis \
    qgis
