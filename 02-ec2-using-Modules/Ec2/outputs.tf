output "aws_public_ip" {
    value = aws_instance.prod.public_ip
}