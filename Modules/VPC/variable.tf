variable "aws_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "aws_private_subnet"{
  description = "Cidr block for private subnets"
  type = string
}

variable "aws_public_subnet"{
  description = "Cidr block for public subnets"
  type = string
}
