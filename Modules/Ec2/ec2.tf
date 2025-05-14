
resource "aws_instance" "prod"{
    ami = var.aws_ami
    instance_type = var.aws_instancetype
    subnet_id = var.public_subnet_cidr
}