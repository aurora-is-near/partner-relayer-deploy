#!/bin/sh

docker-compose -f docker-compose.yaml up --scale endpoint=6 --remove-orphans -d
