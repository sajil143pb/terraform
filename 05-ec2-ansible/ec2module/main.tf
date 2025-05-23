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


resource "aws_instance" "instance"{
    ami = var.aws_ami
    instance_type = var.aws_instance_type
    key_name = var.key_name
    count = var.instance_count
    vpc_security_group_ids  = var.securitygroups
    subnet_id = var.publicsubnet
        tags = {
        Name = var.instance_name
}
}

