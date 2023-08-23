provider "aws" {
  region = "us-east-1" # Change this to your desired AWS region
}

resource "aws_s3_bucket" "example" {
  bucket = "my-terraform-bucket" # Change this to your desired bucket name
  acl    = "private"
}
