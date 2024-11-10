variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "aws_instance_type" {
    type = string
    default = "t3.micro"
}

variable "aws_vpc_public" {
    type = string
    default = "10.0.0.0/24"  
}

variable "aws_vpc_private" {
    type = string
    default = "10.0.0.1/24"
}

variable "aws_vpc" {
    type = string
    default = "10.0.0.0/16"
  
}