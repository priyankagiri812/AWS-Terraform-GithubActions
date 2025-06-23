# This Terraform configuration file sets up an AWS EC2 instance with a security group and subnet.
resource "aws_instance" "mywebserver" {
  ami           = "ami-0b09627181c8d5778"
  instance_type = "t2.micro"
  subnet_id     = var.ps
  security_groups = [var.sg]
  tags = {
    Name = "MyWebServer_updated"
}
}