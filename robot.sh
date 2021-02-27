#!/bin/bash
DELAY=2
while true
do
	curl http://192.168.99.100:8080/ | grep \<h2
	sleep $DELAY
	curl http://192.168.99.100:8080/owners | grep \<h2
	sleep $DELAY
	curl http://192.168.99.100:8080/owners/find | grep \<h2
	sleep $DELAY
	curl http://192.168.99.100:8080/owners?lastName=Davis | grep \<h2
	sleep $DELAY
	curl http://192.168.99.100:8080/owners/1 | grep \<h2
	sleep $DELAY
	curl http://192.168.99.100:8080/owners/2 | grep \<h2
	sleep $DELAY
	curl http://192.168.99.100:8080/owners/3 | grep \<h2
	sleep $DELAY
	curl http://192.168.99.100:8080/vets.html | grep \<h2
	sleep $DELAY
	curl http://192.168.99.100:8080/oups
	sleep $DELAY
	curl http://192.168.99.100:8080/ | grep \<h2
	sleep $DELAY
done
