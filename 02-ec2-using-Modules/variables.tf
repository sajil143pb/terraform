variable "aws_ami"{
    description = "value of the AMI to use for the EC2 instance"
    type = string
}

variable "aws_instancetype"{
    description = "value of the instance type to use for the EC2 instance"
    type = string
}


variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}
