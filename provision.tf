# resource "null_resource" "provision_exec" {
#   connection {
#     type        = "ssh"
#     host        = aws_instance.server.public_ip
#     user        = "ubuntu"
#     private_key = file("terraform.pem")
#     agent       = true
#   }

#   provisioner "file" {
#     source      = "server.py"
#     destination = "/home/ubuntu/server.py"
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "sudo apt-get -y update",
#       "sudo apt install -y python3-dev python3-pip build-essential",
#       "sudo pip3 install boto3[crt]",
#       "sudo python3 server.py ${aws_instance.server.id} ${var.region} ${var.aws_access_key} ${var.aws_secret_key}"
#     ]
#   }

#   depends_on = [aws_instance.server]

# }