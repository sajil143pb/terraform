variable "aws_instnace_type" {
    description = "instance type"
}

variable "aws_ami"{
    description = "ami id"
}

variable "aws_key"{
    description = "ami key"
    default = "ansible"
}

variable "ec2_ansible_count"{
    description = "Add the no slves to create"
    type = map(number)
    default = {
      "master" = 1
      "slave" = 2
    }
}


variable "instance_name"{
    description = "ami id"
    type = map(string)
    default = {
      ec2-ansible-master = "ansible-master"
      ec2-ansible-slave  = "asnible-slave"
    }

}