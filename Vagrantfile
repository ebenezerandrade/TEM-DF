
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "temDFEnvironmentDevelop"

  config.vm.network :forwarded_port, guest: 3000, host: 3000
  
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "1024"]
  end
  
  config.vm.provision "shell", path: "script/setup.sh"
end