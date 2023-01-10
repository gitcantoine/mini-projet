# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "almalinux/8"

  # set servers list and parameters
  NODES = [
  	{ :hostname => "projet-docker", :ip => "192.168.56.60", :cpus => 2, :mem => 2048 },
  ]
  
  # run installation
  NODES.each do |node|
    config.vm.define node[:hostname] do |cfg|
      # Private network with static ip
      cfg.vm.hostname = node[:hostname]
      cfg.vm.network "private_network", ip: node[:ip]
      # Configure VirtualBox
      cfg.vm.provider "virtualbox" do |v|
	v.customize [ "modifyvm", :id, "--cpus", node[:cpus] ]
	v.customize [ "modifyvm", :id, "--memory", node[:mem] ]
	v.customize [ "modifyvm", :id, "--natdnshostresolver1", "on" ]
	v.customize [ "modifyvm", :id, "--natdnsproxy1", "on" ]
        v.customize [ "modifyvm", :id, "--name", node[:hostname] ]
	v.customize [ "modifyvm", :id, "--ioapic", "on" ]
	v.customize [ "modifyvm", :id, "--nictype1", "virtio" ]
      end #end provider
      # Install docker, docker compose and set application student-list and local registry docker
      cfg.vm.provision "shell", path: "install-docker.sh"
    end # define
  end # Nodes
end # configure
