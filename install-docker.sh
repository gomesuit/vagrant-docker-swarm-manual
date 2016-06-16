#!/bin/sh

HOST_ADDRESS=$1

echo $HOST_ADDRESS

yum install -y docker

cat <<EOF > /etc/sysconfig/docker-network
# /etc/sysconfig/docker-network
DOCKER_NETWORK_OPTIONS="-H tcp://0.0.0.0:2375 --cluster-store=consul://192.168.33.10:8500 --cluster-advertise=$HOST_ADDRESS:2376"
EOF

systemctl start docker

echo 'export DOCKER_HOST=tcp://localhost:2375' >> /root/.bashrc
