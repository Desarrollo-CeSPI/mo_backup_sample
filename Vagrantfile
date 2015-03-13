# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.5.0"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :box
  end

  config.vm.define 'backup', primary: true do |app|
    app.vm.hostname = "backup.desarrollo.unlp.edu.ar"
    app.omnibus.chef_version = "11.16.4"
    app.vm.box = "chef/ubuntu-12.04"
    app.vm.network :private_network, ip: "10.100.150.2"
    app.berkshelf.enabled = true
    app.vm.provision :chef_solo do |chef|
      chef.json = {
      }
      chef.run_list = [
        "recipe[mo_backup::install]",
        "recipe[mo_backup_sample::default]"
      ]
    end
  end

end
