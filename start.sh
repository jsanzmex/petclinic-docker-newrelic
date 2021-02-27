#!/bin/sh

docker kill petclinic
docker rm petclinic

docker build -t petclinic .
docker run --name petclinic -p 8080:8080 -it petclinic "-Dnewrelic.config.app_name=$NEWRELIC_APP_NAME" "-Dnewrelic.config.license_key=$NEWRELIC_LICENSE_KEY"


