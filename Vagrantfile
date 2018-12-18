Vagrant.require_version '>= 1.6.0'
VAGRANTFILE_API_VERSION = '2'.freeze

# Require YAML module
require 'yaml'

# Read YAML file with box details
# p servers
servers = YAML.load_file('servers.yml')
# Create boxes

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Iterate through entries in YAML file

  servers.each do |server|
    config.vm.define server['hostname'] do |srv|
      if !server['box_url'].nil?
        srv.vm.box_url = server['box_url']
      elsif server['box_version']
        (srv.vm.box_version = server['box_version'])
      end
      if server['port_forwarding']
        server['port_forwarding'].each do |pf|
          srv.vm.network 'forwarded_port', guest: pf['guest_port'], host: pf['host_port']
        end
      end

      srv.vm.box = server['box']
      srv.vm.hostname = server['hostname']
      srv.vm.network 'private_network', ip: server['ip_address']
      if server['hostname'].include? "master"
        srv.vm.synced_folder server['hostname'], '/home/vagrant/k8s' #, create: true
      end

      # Virtaulbox specific configuration
      srv.vm.provider :virtualbox do |vb|
        vb.memory = server['ram']
        vb.cpus = server['cpus']
      end

      srv.vm.provision "ansible_local" do |ansible|
        ansible.playbook = "install-docker.yml"
      end
      
      srv.vm.provision "ansible_local" do |ansible|
       ansible.playbook = "k8s-common.yml"
      end

      if server['playbook']
        srv.vm.provision "ansible_local" do |ansible|
          ansible.playbook = server['playbook']
        end
      end
    end
  end
end
