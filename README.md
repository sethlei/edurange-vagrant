# THIS IS NO LONGER MAINTAINED - USE https://github.com/edurange/edurange-vagrant


# EDURange Vagrant Build Environment

## What is this?
The EDURange Vagrant Build Environment project allows for fast deployment of a new virtual machine with the EDURange project pre-installed. In short, by installing Vagrant, copying this repository, and running 'Vagrant up' in the project folder, you will have a virtual machine with a fully functional version of the EDURange project on it. 

## THIS IS NOT FOR PRODUCTION USE. DO NOT USE IN A PRODUCTION ENVIRONMENT.
The presets chosen for this VM are done to make testing easier. They are not secure for use in production environment. Instead, follow the instructs on the EDURange project for setting up a VM from scratch, or download a pre-made image from one of our hosting partners.

## Who should use this?
1. EDURange developers and contributors
2. Automated test runners

## This project handles the following for you:

1. Configures and creates an up to date virtual machine (Ubuntu 22.04 as of now)
2. Automatically installs all pre-requisite software required to build and run EDURange
3. Configures port forwarding from the VM to the host so the VM can receive network requests
4. Automatically installs and configures EDURange for developers use or test runners

## This project does not:

1. Does not setup any special configurations including those that would be used in a real production environment
2. Does not automatically run 'npm start' for you
3. Does not install /requirements/dev.txt packages. This is for test runner compatability reasons.
4. Currently, this does not run on Apple M1 since we don't have an ARM base box (You can fix this! Make a PR if you do so it can be merged!)

## How do I use this?
1. Install Vagrant ( https://www.vagrantup.com/downloads )
2. Clone this repo
3. In the repo's directory in your terminal, type 'vagrant up'
4. Sit back and relax - initial builds can take a while even with good Internet and a fast computer
5. Once it's finished, type 'vagrant ssh' in your terminal, and proceed like normal

## Okay, so I have it running. How do I shut it down?
1. 'Vagrant halt' from the host terminal will gracefully shutdown the VM
2. 'Vagrant destroy' will delete the VM. Make sure you have a copy of any files you want to save before doing this. You DO NOT need to destroy the VM to restart it 

## Useful commands / comments:
1. 'Vagrant reload' - stops the container if it is running, and restarts it. This is especially useful if you get issues with ports being reserved
2. 'Vagrant ssh-config' - generates a SSH config you can use to connect to this VM. I use this when I connect Visual Studio Code to the container
3. 'Vagrant scp' - Just like regular scp. Really useful for moving files between the host and container
4. 'Vagrant status' or 'Vagrant global-status' - shows the status of the VMs running on the host
5. Alter the Vagrantfile to allow access to port 5555 (for Flower)

## Vagrant says some port is in use. How do I fix this?
1. Check the status of your vagrant VMs using 'vagrant global-status'
2. If you have VMs running that conflict with EDURange, halt those other containers.
3. If all your other VMs are stopped and you still have port issues, then you might need to restart the NAT port service for your VM hypervisor (VMWare calls this the 'VMWare NAT Service')
4. If that doesn't work, or you can't find that service, just restart your PC 
5. If it's still broken after that, join the Discord and we can try to help you

## Okay, what else should I know?
1. Right now, we reserve ports 49000 to 49200. For some reason, Terraform seems to choose these ports for passing SSH access to EDURange containers. If this changes in the future, you will have to update this in the Vagrantfile 
2. You can make a separate bootstrap.sh file that contains your own changes you want to have when the container is provisioned. This would be nice if you want to automatically install dev requirements etc 
3. Hyper-V, WSL, and your virtual machine host may conflict. This is not an issue with this repository, and instead is a configuration issue with your machine
4. The defaults chosen via the './install.sh auto' are not secure. Do not run this in production. Instead, use './install.sh' and follow the prompts presented
5. When you run 'Vagrant up', a folder called '.vagrant' appears in the directory. This is the directory that contains the Vagrant VM you just created. 'Vagrant status' will show you the status of this VM. To see the status of all Vagrant VMs on the host, run 'vagrant global-status'