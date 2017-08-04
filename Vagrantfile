# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Base configuration for the VM and provisioner
  config.vm.box = "Metasploitable3"
  config.name = "Metasploitable3"
  config.vm.hostname = "metasploitable3"
  config.vm.communicator = "winrm"
  config.winrm.retry_limit = 60
  config.winrm.retry_delay = 10

  config.vm.network "private_network", type: "dhcp"

  # Configure Firewall to open up vulnerable services
  case ENV['MS3_DIFFICULTY']
  when 'easy'
    config.vm.provision :shell, path: "scripts/configs/disable_firewall.bat"
  else
    config.vm.provision :shell, path: "scripts/installs/setup_iis.bat"
    config.vm.provision :shell, path: "scripts/installs/install_backdoors.bat"
    config.vm.provision :shell, path: "scripts/installs/install_flags.bat"
    config.vm.provision :shell, path: "scripts/configs/enable_firewall.bat"
    config.vm.provision :shell, path: "scripts/configs/configure_firewall.bat"
  end
end
