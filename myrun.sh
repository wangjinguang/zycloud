#!/usr/bin/env bash

set -e

# Build the project and docker images
#mvn clean install

# Export the active docker machine IP
#export DOCKER_IP=$(docker-machine ip $(docker-machine active))
export DOCKER_IP=192.168.1.128
# Remove existing containers
docker-compose stop
docker-compose rm -f

# Start the config service first and wait for it to become available
docker-compose up -d config-service

while [ -z ${CONFIG_SERVICE_READY} ]; do
  echo "Waiting for config service..."
  if [ "$(curl --silent $DOCKER_IP:8888/health 2>&1 | grep -q '\"status\":\"UP\"'; echo $?)" = 0 ]; then
      CONFIG_SERVICE_READY=true;
  fi
  sleep 2
done

#while [ -z ${CONFIG_SERVICE_READY} ]; do
#  echo "Waiting for config service..."
#  if [ "$(nc $DOCKER_IP -z -w 4 8888; echo $?)" = 0 ]; then
#      CONFIG_SERVICE_READY=true;
#  fi
#  sleep 2
#done

# Start the discovery service next and wait
docker-compose up -d discovery-service

while [ -z ${DISCOVERY_SERVICE_READY} ]; do
  echo "Waiting for discovery service..."
  if [ "$(curl --silent $DOCKER_IP:8761/health 2>&1 | grep -q '\"status\":\"UP\"'; echo $?)" = 0 ]; then
      DISCOVERY_SERVICE_READY=true;
  fi

# #if [ "$(nc $DOCKER_IP -z -w 4 8761; echo $?)" = 0 ]; then
#      DISCOVERY_SERVICE_READY=true;
#  fi
  sleep 2
done

# Start the other containers
docker-compose up -d

# Attach to the log output of the cluster
docker-compose logs
