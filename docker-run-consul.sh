#!/bin/sh

HOST_NAME=$1
HOST_ADDRESS=$2

echo $HOST_NAME
echo $HOST_ADDRESS

docker run -d \
	-p 8300:8300 \
	-p 8301:8301 \
	-p 8301:8301/udp \
	-p 8302:8302 \
	-p 8303:8302/udp \
	-p 8500:8500 \
	-p 53:53 \
	-p 53:53/udp \
	--name consul \
	-h $HOST_NAME \
	progrium/consul -server -bootstrap -advertise $HOST_ADDRESS
