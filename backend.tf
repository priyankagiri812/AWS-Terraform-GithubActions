# This file configures the backend for Terraform state management.
# It uses an S3 bucket for storing the state files and a DynamoDB table for state locking.
terraform {
  backend "s3" {
    bucket = "506732059186-s3bucket"
    key    = "state"
    region = "ap-south-1"
    dynamodb_table = "terraform_state"
  }
}