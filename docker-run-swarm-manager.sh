#!/bin/sh

docker run -d \
	-p 2377:2375 \
	--name swarm-manager \
	swarm manage consul://192.168.33.10:8500/my_cluster
