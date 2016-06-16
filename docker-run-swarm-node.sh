#!/bin/sh

NODE_ADDRESS=$1

echo $NODE_ADDRESS

docker run -d \
	--name swarm-node \
	swarm join --addr=$NODE_ADDRESS:2375 consul://192.168.33.10:8500/my_cluster
