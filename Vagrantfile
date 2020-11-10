# encoding: utf-8
# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.hostname = "start-here-vm"
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = ">=0"
  config.vm.box_check_update = false
  #config.vm.box_url = "https://vagrantcloud.com/ubuntu/focal64"
  config.vm.network :forwarded_port, guest: 80, host: 8080, id: "HTTP80", protocol: "tcp", auto_correct: true
  config.vm.define :devops do |devops|
  end

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.memory = "4096"
    vb.cpus = 2
    vb.name = "start-here-vm"
    vb.linked_clone = false
    vb.customize ["modifyvm", :id, "--ioapic", "on"]
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000 ]
  end

  config.vm.provision "shell", path: "provision.sh"
  
end
