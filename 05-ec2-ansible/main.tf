variables "instance_type" {
    description = "instance type"
    # type = map(string)

    # default = {
    #     "dev" "t2.micro"
    # }
}

variables "aws_ami"{
    description = "ami id"
    default = "ami-0953476d60561c955"
}

module "ec2"{
    source ="./ec2module"
    instance_type = var.instance_type
    ami = var.aws_ami
    
    userdata = 
}

