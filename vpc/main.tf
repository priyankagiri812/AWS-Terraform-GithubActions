#This Terraform configuration creates a VPC with the specified CIDR block and enables DNS support and hostnames.
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "mysubnet" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.subnet_cidr_block
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "mysg" {
    name        = "my-security-group"
    description = "Allow SSH traffic"
    vpc_id     =  aws_vpc.myvpc.id
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
}
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}