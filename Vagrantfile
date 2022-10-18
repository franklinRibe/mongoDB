# -*- mode: ruby -*-
# vi: set ft=ruby :

# Definição de maquinas do Laboratório de MongoDB
machines = {
	"router-mongo" => { "ip" => "10",  "memory" => "512", "cpus" => "1" },
	"conf-01"      => { "ip" => "20",  "memory" => "512", "cpus" => "1" },
	"conf-02"      => { "ip" => "30",  "memory" => "512", "cpus" => "1" },
	"sh-pri-01"    => { "ip" => "40",  "memory" => "512", "cpus" => "1" },
	"sh-pri-02"    => { "ip" => "50",  "memory" => "512", "cpus" => "1" },
	"sh-seg-01"    => { "ip" => "60",  "memory" => "512", "cpus" => "1" },
	"sh-seg-02"    => { "ip" => "70",  "memory" => "512", "cpus" => "1" },
	"monitor"      => { "ip" => "254", "memory" => "512", "cpus" => "1" },
}

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  machines.each do |name,conf|
    config.vm.define "#{name}" do |srv|
      srv.vm.hostname = "#{name}.example.com"
      srv.vm.network 'private_network', ip: "191.16.20.#{conf["ip"]}"
      srv.vm.provider 'virtualbox' do |vb|
        vb.name = "#{name}"
        vb.memory = "#{conf["memory"]}"
        vb.cpus = "#{conf["cpus"]}"
      end
      
      srv.vm.provision "shell", inline: <<-SHELL
        echo "root:Senh@123" | chpasswd
        sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
        sudo systemctl restart sshd
      SHELL

      srv.vm.provision "shell" do |s| 
        s.path = "provision/prereq.sh"
        s.args = [config.vm.box]
      end
      
      srv.vm.provision "shell" do |s| 
        s.path = "provision/install_exporters.sh"
        s.args = [config.vm.box]
      end

      if "#{name}" == "monitor" then
        srv.vm.provision "shell" do |s| 
          s.path = "provision/install_prometheus.sh"
          s.args = [config.vm.box]
        end
      end
      if "#{name}" != "monitor" then
        srv.vm.provision "shell" do |s| 
          s.path = "provision/install_mongo.sh"
          s.args = [config.vm.box]
        end
      end
  
    end

  end

end
