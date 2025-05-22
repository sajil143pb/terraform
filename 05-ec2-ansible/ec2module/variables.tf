variable "aws_ami" {
    description = "Conatins ami id"
}

variable "instance_name" {
    description = "Conatins ami id"
}
variable "aws_instnace_type"{
    description = "Contains aws instnace type"
}

variable "key_name"{
    description = "Contains aws instnace type"
}

variable "instance_count"{
    description = "Number of instances to create"
    type = number
}

variable "securitygroups"{
    description = "Number of instances to create"
    type = set(string)
}

variable "publicsubnet"{
    description = "Number of instances to create"
}