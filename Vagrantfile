# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.vm.provider :libvirt do |libvirt|
        libvirt.driver = "vbox"
    end
    config.vm.box = "generic/ubuntu2004"
    config.vm.box_version = "3.1.16"
    config.vm.network :forwarded_port, guest: 443, host: 8080
    #config.vm.synced_folder "/home/ubuntu/Workspace/opencart/somedomain.co.il/", "/var/www/opencart",
    #  owner: "www-data", group: "www-data"
    config.vm.provision:shell, inline: <<-SHELL
        echo "root:rootroot" | sudo chpasswd
        sudo timedatectl set-timezone Asia/Jerusalem
    SHELL

    config.vm.define "ubuntu20.04" do |ubuntu|
        ubuntu.vm.hostname = "ubuntu20.04"
    end

    config.vm.provision:shell, path: "bootstrap.sh"
end