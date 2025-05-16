terraform{
    required_providers{
    aws = {
        source = "hashicorp/aws"
        version = "~> 4.0"
        }
    }
}

provider "aws" {
    region = "us-east-1"
}

variable "aws_instance"{
    description = " Instance type"
}

variable "aws_ami"{
    description = " ami id"
    }


resource "aws_instance" "instance"{
    instance_type = var.aws_instance
    ami = var.aws_ami
}