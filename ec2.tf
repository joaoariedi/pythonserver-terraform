resource "aws_instance" "server" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  key_name        = "terraform"
  security_groups = [aws_security_group.allow-tcp.name]

  tags = {
    "Name"  = var.nameTag
    "Owner" = var.ownerTag
  }

  connection {
    type        = "ssh"
    host        = aws_instance.server.public_ip
    user        = "ubuntu"
    private_key = file("terraform.pem")
    agent       = true
  }

  provisioner "file" {
    source      = "server.py"
    destination = "/home/ubuntu/server.py"
  }

  user_data = <<-EOF
  #!/bin/bash
  echo "userdata-start"
  sudo apt-get -y update
  sudo apt install -y python3-dev python3-pip build-essential
  sudo pip3 install boto3[crt]
  instance_id=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id)
  sudo python3 /home/ubuntu/server.py $instance_id ${var.region} ${var.aws_access_key} ${var.aws_secret_key}
  echo "userdata-end"
  EOF
}

# ---------------------------------------------------------------------------------------------------------------------
# LOOK UP THE LATEST UBUNTU AMI
# ---------------------------------------------------------------------------------------------------------------------

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}