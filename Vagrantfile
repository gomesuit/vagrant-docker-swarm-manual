# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.synced_folder ".", "/home/vagrant/sync", disabled: true

  config.vm.box = "centos/7"

  config.vm.define :master do |host|
    HOSTNAME = "master"
    PRIVATE_IP_ADDRESS = "192.168.33.10"

    host.vm.hostname = HOSTNAME
    host.vm.network "private_network", ip: PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-common-package.sh"
    host.vm.provision :shell, path: "stop-firewall.sh"
    host.vm.provision :shell, path: "set-hosts.sh"
    host.vm.provision :shell, path: "install-docker.sh"
  end

  config.vm.define :node01 do |host|
    HOSTNAME = "node01"
    PRIVATE_IP_ADDRESS = "192.168.33.20"

    host.vm.hostname = HOSTNAME
    host.vm.network "private_network", ip: PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-common-package.sh"
    host.vm.provision :shell, path: "stop-firewall.sh"
    host.vm.provision :shell, path: "set-hosts.sh"
    host.vm.provision :shell, path: "install-docker.sh"
  end

  config.vm.define :node02 do |host|
    HOSTNAME = "node02"
    PRIVATE_IP_ADDRESS = "192.168.33.30"

    host.vm.hostname = HOSTNAME
    host.vm.network "private_network", ip: PRIVATE_IP_ADDRESS
    host.vm.provision :shell, path: "install-common-package.sh"
    host.vm.provision :shell, path: "stop-firewall.sh"
    host.vm.provision :shell, path: "set-hosts.sh"
    host.vm.provision :shell, path: "install-docker.sh"
  end

end