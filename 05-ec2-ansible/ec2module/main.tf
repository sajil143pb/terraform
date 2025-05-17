terraform{
    required_provders {
        aws ={
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}

provder "aws"{
    region = "us-east-1"
}

variables "aws_ami" {
    description = "Conatins ami id"
}

variables "aws_instnace_type"{
    description = "Contains aws instnace type"
}

resource "aws_instnace" "instance"{
    ami = var.aws_ami
    instance_type = var.aws_instance
}

