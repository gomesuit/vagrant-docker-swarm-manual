# vagrant-docker-swarm-manual

## overlay-networkの作成
```
docker -H 192.168.33.10:2377 network create --driver overlay --subnet=10.0.9.0/24 my_network
```

## 検証用コンテナの作成
```
docker -H 127.0.0.1:2377 run --name=busybox01 --net=my_network -d -ti busybox /bin/sh
docker -H 127.0.0.1:2377 run --name=busybox02 --net=my_network -d -ti busybox /bin/sh
```

## overlay-networkの疎通確認
```
docker -H 127.0.0.1:2377 exec -it busybox02 ping busybox01 -c 3
docker -H 127.0.0.1:2377 exec -it busybox01 ping busybox02 -c 3
```