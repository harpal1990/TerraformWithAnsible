#!/bin/bash
sudo apt-get -y update
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd.service
sudo systemctl restart ssh.service
sudo rm -rf /root/.ssh/authorized_keys
sudo touch /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys
sudo echo ssh-rsa user_ssh_public_key= root@Harpal-PC > /root/.ssh/authorized_keys
sudo chmod 777 /tmp
sudo echo ssh-rsa 
