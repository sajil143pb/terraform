terraform {
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

module "vpc"{
    source = "./VPC"
    aws_cidr_block = var.vpc_cidr_block
    aws_private_subnet = var.private_subnet_cidr
    aws_public_subnet = var.public_subnet_cidr
}

module "ec2"{
    source = "./Ec2"
    aws_ami = var.aws_ami
    aws_instancetype = var.aws_instancetype
    public_subnet_cidr = module.vpc.public_subnets

}

