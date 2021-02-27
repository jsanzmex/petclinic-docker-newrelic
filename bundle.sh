#!/bin/sh

# Reference: https://stackoverflow.com/questions/32727594/how-to-pass-arguments-to-shell-script-through-docker-run

java -Dserver.port=8080 \
     -Dserver.context-path=/petclinic/ \
     -Dspring.messages.basename=messages/messages \
     -Dlogging.level.org.springframework=INFO \
     -Dsecurity.ignored=/** \
     -Dbasic.authentication.enabled=false \
     -Dserver.address=0.0.0.0 \
     -javaagent:/usr/local/newrelic/newrelic/newrelic.jar "$@" \
     -jar /app/app.jar

