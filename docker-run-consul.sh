#!/bin/sh

docker run -d \
	-p 8500:8500 \
	-p 53:53/udp \
	--name consul \
	-h master \
	progrium/consul -server -bootstrap -advertise 192.168.33.10
