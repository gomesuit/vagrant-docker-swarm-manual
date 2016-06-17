#!/bin/sh

NODE_ADDRESS=$1

echo $NODE_ADDRESS

docker run -d \
	--name swarm-node \
	--link=consul \
	swarm join --addr=$NODE_ADDRESS:2375 consul://consul:8500/my_cluster
