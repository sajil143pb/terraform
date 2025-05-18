terraform{
    required_providers {
        aws ={
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

provider "aws"{
    region = "us-east-1"
}

variable "aws_ami" {
    description = "Conatins ami id"
}

variable "instance_name" {
    description = "Conatins ami id"
}
variable "aws_instnace_type"{
    description = "Contains aws instnace type"
}

variable "key_name"{
    description = "Contains aws instnace type"
}

variable "instance_count"{
    description = "Number of instances to create"
    type = number
}

output "public_ips" {
  value = aws_instance.instance[*].public_ip
}

resource "aws_instance" "instance"{
    ami = var.aws_ami
    instance_type = var.aws_instnace_type
    key_name = var.key_name
    count = var.instance_count
    tags = {
        Name = var.instance_name
}
}

