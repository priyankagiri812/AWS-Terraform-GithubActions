output "public_subnet" {
    value = aws_subnet.mysubnet.id
}

output "security_group" {
    value = aws_security_group.mysg.id
}