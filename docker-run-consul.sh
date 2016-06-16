#!/bin/sh

docker run -d \
	-p 8500:8500 \
	--name consul01 \
	-h consul01 \
	progrium/consul -server -bootstrap
