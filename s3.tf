resource "aws_s3_bucket" "bucket" {
  bucket = "flugel-bucket-test"
  acl    = "private"

  tags = {
    "Name"  = var.nameTag
    "Owner" = var.ownerTag
  }
}