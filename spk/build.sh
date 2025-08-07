#!/bin/bash

set -e

pushd $(dirname $0)/..

docker build \
    -t qgis/qgis3-build-deps \
    -f .docker/qgis3-qt5-build-deps.dockerfile \
    .

docker build \
    -t qgis/qgis \
    --build-arg DOCKER_TAG=latest \
    -f .docker/qgis.dockerfile \
    .
