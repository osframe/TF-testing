resource "random_string" "my_numbers" {
  length  = 12
  special = false
  upper   = false
  lower   = true
  numeric = true
}

resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "epam-tf-lab-${random_string.my_numbers.result}"
}