Vagrant.configure("2") do |config|

    config.vm.provider :virtualbox do |v|
      v.memory = 1024
    end
  
    config.vm.define "oracle-java7" do |db|
      db.vm.box = "ubuntu/xenial64"
      db.vm.hostname = "xenial-oracle-java7"
      db.vm.network :private_network, ip: "10.10.10.10", nic_type: "virtio"
      db.vm.synced_folder "./", "/home/vagrant/oracle-java7-installer/"
      db.vm.provision "file", source: "./fpm", destination: "/home/vagrant/bin/fpm"
      db.vm.provision "docker" do |d|
        d.build_image "/home/vagrant/oracle-java7-installer/", args: "-t fpm:latest -f /home/vagrant/oracle-java7-installer/Dockerfile.fpm"
      end
      db.vm.provision "shell", path: "build_jdk_package.sh"
      db.vm.provision "shell", path: "install_jdk_package.sh", privileged: true
      db.vm.provision "shell", inline: "echo 'Installed java version info' && java -version"
    end
  end
