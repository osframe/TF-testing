output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "security_group_id_ssh" {
  value = aws_security_group.ssh-inbound.id
}

output "security_group_id_http" {
  value = aws_security_group.http-inbound.id
}

output "security_group_id_http_lb" {
  value = aws_security_group.lb-http-inbound.id
}

output "iam_instance_profile_name" {
  value = aws_iam_instance_profile.my_instance_profile.name
}

output "key_name" {
  value = aws_key_pair.My_keypair.key_name
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_s3_bucket.bucket
}