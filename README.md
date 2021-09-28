# Flugel challenge
## General notes


### I'm having a some issues
- The first one is terraform isn't skiping python server running to complete de provisioning. I tried to hide de outputs or use threading, tmus but no success yet.
- I wanted to make the code more dynamic, but that was my first time in terraform, I spent maybe 5 ours to did it.
- I have to create Gitlab Actions, but this week I'm very busy with some projects, I think I can do it by tomorrow.


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

 There is an issue to do tests, related to run the server, I'm trying to fix it.