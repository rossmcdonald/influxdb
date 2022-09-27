# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # config.vm.box = "ubuntu/trusty64"
  # config.vm.box = "ubuntu/wily64"
  # config.vm.box = "sgallen/wily64"
  # config.vm.box = "ubuntu/vivid64"
  # config.vm.box = "relativkreativ/centos-7-minimal"
  # config.vm.box = "box-cutter/fedora22"
  config.vm.box = "puppetlabs/centos-6.6-64-nocm"
  # config.vm.box = "debian/jessie64"

  BOX_COUNT = 1
  (1..BOX_COUNT).each do |machine_id|
    config.vm.define "influx#{machine_id}" do |machine|
      machine.vm.hostname = "influx#{machine_id}"
      machine.vm.network "private_network", type: "dhcp"
      # machine.vm.network "public_network"
      # machine.vm.network "public_network", :bridge => 'en0: Wi-Fi (AirPort)'

      machine.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 1
      end

      if machine_id == BOX_COUNT
        machine.vm.provision "ansible" do |ansible|
          # ansible.verbose = 'vvvv'
          ansible.limit = 'all'
          if BOX_COUNT > 1
            ansible.playbook = "cluster-test.yml"
          else
            ansible.playbook = "test.yml"
          end
          ansible.sudo = true
          ansible.host_key_checking = false
          ansible.extra_vars = {
            is_vagrant: true,
          }
        end
      end

    end
  end
end
