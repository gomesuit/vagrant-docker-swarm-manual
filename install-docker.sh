#!/bin/sh

HOST_ADDRESS=$1

echo $HOST_ADDRESS

yum install -y docker

cat <<EOF > /etc/sysconfig/docker-network
# /etc/sysconfig/docker-network
DOCKER_NETWORK_OPTIONS="-H tcp://0.0.0.0:2375 --cluster-store=consul://$HOST_ADDRESS:8500 --cluster-advertise=$HOST_ADDRESS:2376 --dns $HOST_ADDRESS --dns 8.8.8.8 --dns-search node.consul"
EOF

systemctl start docker

echo 'export DOCKER_HOST=tcp://localhost:2375' >> /root/.bashrc
