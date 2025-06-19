# This Terraform configuration file sets up an AWS EC2 instance with a security group and subnet.
resource "aws_instance" "mywebserver" {
  ami           = "ami-0b09627181c8d5778"
  instance_type = "t2.micro"
  subnet_id     = var.ps
  security_groups = [var.sg]
  tags = {
    Name = "MyWebServer"
}
}

# This file also configures an S3 bucket for remote state storage and a DynamoDB table for state locking.
resource "aws_s3_bucket" "mybucket" {
  bucket = "506732059186-s3bucket"
  tags = {
        Name = "S3 Remote Terraform State Store"
    }
}

resource "aws_dynamodb_table" "terraform-lock" {
    name           = "terraform_state"
    read_capacity  = 5
    write_capacity = 5
    hash_key       = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
    tags = {
        "Name" = "DynamoDB Terraform State Lock Table"
    }
}