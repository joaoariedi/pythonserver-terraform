
output "server_tags" {
  value = aws_instance.server.tags
}

output "bucket_tags" {
  value = aws_s3_bucket.bucket.tags
}

output "server_public_ip" {
  value = aws_instance.server.public_ip
}