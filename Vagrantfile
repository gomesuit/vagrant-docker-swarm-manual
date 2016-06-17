# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true

  config.vm.box = "centos/7"

  MASTER_NODE_IP_ADDRESS = "192.168.33.10"

  config.vm.define :master do |host|
    _HOSTNAME = "master"
    _PRIVATE_IP_ADDRESS = MASTER_NODE_IP_ADDRESS
    _CONSUL_ARGS = _HOSTNAME + " " + _PRIVATE_IP_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-common-package.sh"
    host.vm.provision :shell, path: "stop-firewall.sh"
    #host.vm.provision :shell, path: "set-hosts.sh"
    host.vm.provision :shell, path: "install-docker.sh", args: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "docker-run-consul.sh", args: _CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
    host.vm.provision :shell, path: "docker-run-swarm-manager.sh"
    host.vm.provision :shell, path: "create-overlay-network.sh"
  end

  config.vm.define :node01 do |host|
    _HOSTNAME = "node01"
    _PRIVATE_IP_ADDRESS = "192.168.33.20"
    _CONSUL_ARGS = _HOSTNAME + " " + _PRIVATE_IP_ADDRESS + " " + MASTER_NODE_IP_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-common-package.sh"
    host.vm.provision :shell, path: "stop-firewall.sh"
    host.vm.provision :shell, path: "set-hosts.sh"
    host.vm.provision :shell, path: "install-docker.sh", args: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "docker-run-consul-node.sh", args: _CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
    host.vm.provision :shell, path: "docker-run-swarm-node.sh", args: _PRIVATE_IP_ADDRESS
  end

  config.vm.define :node02 do |host|
    _HOSTNAME = "node02"
    _PRIVATE_IP_ADDRESS = "192.168.33.30"
    _CONSUL_ARGS = _HOSTNAME + " " + _PRIVATE_IP_ADDRESS + " " + MASTER_NODE_IP_ADDRESS

    host.vm.hostname = _HOSTNAME
    host.vm.network "private_network", ip: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-common-package.sh"
    host.vm.provision :shell, path: "stop-firewall.sh"
    host.vm.provision :shell, path: "set-hosts.sh"
    host.vm.provision :shell, path: "install-docker.sh", args: _PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "docker-run-consul-node.sh", args: _CONSUL_ARGS
    host.vm.provision :shell, path: "set-dns.sh"
    host.vm.provision :shell, path: "docker-run-swarm-node.sh", args: _PRIVATE_IP_ADDRESS
  end

end
