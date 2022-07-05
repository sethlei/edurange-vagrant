Vagrant.configure("2") do |config|
  config.vm.box = "generic/ubuntu2204"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network "forwarded_port", guest: 5000, host: 5000, host_ip: "127.0.0.1"
  config.vm.network "forwarded_port", guest: 5050, host: 5050, host_ip: "127.0.0.1"
  # Adding SSH ports for Edurange containers
  for i in 47000..50000
    config.vm.network :forwarded_port, guest: i, host: i
  end
end