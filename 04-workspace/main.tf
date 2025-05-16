variable "aws_ami"{
    description = "Value of the aws ami"

}

variable "aws_instance"{
    description = "aws instance type"
    type = map(string)

    default = {
      "prod" = "t2.micro"
      "dev" = "t3.micro"
    }
}

module "aws_ec2"{
    source = "./Ec2module/"
    aws_ami = var.aws_ami
    aws_instance = lookup(var.aws_instance, terraform.workspace, "error")
}