#!/bin/bash
sudo apt-get -y update
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd.service
sudo systemctl restart ssh.service
sudo rm -rf /root/.ssh/authorized_keys
sudo touch /root/.ssh/authorized_keys
sudo chmod 600 /root/.ssh/authorized_keys
sudo echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDL1zxb7sNRA9jcRJYD7e/CAWQ+VTwWwhF4KefP/XEDR4wQlTD0K9fzLJXBCDCPtaDgv/juzWo4nF1iGsrrNhIJ3PT7EatVo+mF/myiY6431d9H1exjc09H+z5yhJIPtkhJ4vHWUD/VLhTUVE/47kgOA66vwF+Mlu6FXZXGQssf1MJ9/egaUsRmjh1h53hq1DaVuwrnWZFX/jtxBMXFbhmqw8umGY8xPGhdqJhFrklrpiCOpEysgRWuqK/W++vK5iu6L6PiKbzmt9MXHyUdJZbMSAn4nq9xVaisTLtztXN/giYR+uU5ME5Muiq7l3mISBV27lJfwHQdN3+hIBYvw9Zhucsqu4mkh5mp7eBILuaJx/lYl5P0OjIPeDqHTqDtIRFGITNGGweNX33HtQcvPC0CqclQ2n0QDlqMQ7vyrkPiMhm9Yjcy3zXH/6WlBoYH5cAamvey52eqwIrRbh/bXN7Pn1hDqcDmuWUQnyKoCOwnWWs+tGgRgrezG9KKRcazAts= root@Harpal-PC > /root/.ssh/authorized_keys
sudo chmod 777 /tmp
sudo echo ssh-rsa 
