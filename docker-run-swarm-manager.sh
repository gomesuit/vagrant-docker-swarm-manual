#!/bin/sh

docker run -d \
	-p 2377:2375 \
	--name swarm-manager \
	--link=consul \
	swarm manage consul://consul:8500/my_cluster
