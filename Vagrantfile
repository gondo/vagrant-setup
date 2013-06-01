# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "CentOS-6.4-x86_64"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"

  #config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :private_network, ip: "10.0.0.80"

  config.vm.synced_folder "www", "/var/www/default/public_html/"

  config.vm.provider "virtualbox" do |v|
    v.name = "dev"
    v.customize ["modifyvm", :id, "--memory", "1024"]
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "chef/cookbooks"
    chef.data_bags_path = "chef/data_bags"
    chef.roles_path = "chef/roles"
    chef.add_role "web"
    chef.log_level = :debug
  end
end