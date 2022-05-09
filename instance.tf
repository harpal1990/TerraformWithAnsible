resource "aws_key_pair" "key-tf" {
  key_name   = "ubuntu"
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
  value = aws_key_pair.key-tf.key_name

}


variable "privatekey" {
  default = "ubuntu"
  
}

resource "aws_instance" "TechEC2Instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  key_name               = "ubuntu"
  
  subnet_id              = aws_subnet.TechVPC_Pub_SN.id
  vpc_security_group_ids = ["${aws_security_group.TechVPC_SG.id}"]
  tags = {
    Name = "Web"
  }
  user_data = file("userdata.sh")
}
  resource "local_file" "ip" {
  content  = aws_instance.TechEC2Instance.public_ip
  filename = "ip.txt"
  
  provisioner "local-exec" {

     command = "sleep 120 && cd /etc/ansible/m2stack/ && ansible-playbook  deploy.yml"
   }
  }



