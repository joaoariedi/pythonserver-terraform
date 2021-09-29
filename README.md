# Flugel challenge
## General notes


### Next improvement
I'll try to send server.py file without provisioner ssh conection


## Conclusion
 - I tried to use the minimal code to do it.
 - I really liked to use terraform


## Requirements
 - Terraform
 - Terratest
 - AWSCLI
 - Create a file secret_varibles.tf and insert AWS credencials as Terraform Variables, it's necessary to use Boto3 on Python server

## Deploy
## Terminal Run at root file
 - terraform init
 - terraform apply
 - curl <public_ip_address>/tags > Return instance tags
 - curl <public_ip_address>/shutdown > Stop instance

## Tests
## Terminal Run at test file
 - go test