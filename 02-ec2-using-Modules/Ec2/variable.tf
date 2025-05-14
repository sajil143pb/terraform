variable "aws_ami"{
    description = "value of the AMI to use for the EC2 instance"
    type = string
}

variable "aws_instancetype"{
    description = "value of the instance type to use for the EC2 instance"
    type = string
}

# variable "aws_security_group_ids"{
#     description = "value of the security group to use for the EC2 instance"
#     type = list(string)
# }


variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}