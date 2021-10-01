variable "region" {
  description = "Define what region the instance will be deployed"
  default     = "sa-east-1"
}

variable "instance_type" {
  description = "aws hardware configuration"
  default     = "t1.micro"
}

variable "ownerTag" {
  description = "The owner tag"
  default     = "InfraTeam"
}

variable "nameTag" {
  description = "The name tag"
  default     = "Flugel"
}
