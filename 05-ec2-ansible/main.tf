resource "null_resource" "copy_key_pair" {
    depends_on = [ module.ec2_ansible_master ]

    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("ansible.pem")
        host = module.ec2_ansible_master.public_ips[0]
    }
    provisioner "file" {
        source = "./ansible.pem"
        destination = "./ansible.pem"
    }
    provisioner "file" {
        source = "./inventory.txt"
        destination = "./inventory.txt"
    }
    provisioner "remote-exec" {
        inline = [ 
            "sudo chmod 400 ansible.pem",
            "sudo yum update -y",
            "sudo yum install -y ansible"
         ]
    }
}

resource "local_file" "inventory" {
  content  = templatefile("${path.module}/inventory.tpl", { ips = module.ec2_ansible_slave.public_ips })
  filename = "${path.module}/inventory.txt"
}

module "ec2_VPC"{
    source = "./VPC"
    aws_cidr_block = var.aws_cidr_block
    aws_private_subnet = var.aws_private_subnet
    aws_public_subnet = var.aws_public_subnet
}

module "vpc_security_group_ids" {
    source = "./securitygroups"
    VPCID = module.ec2_VPC.vpc_id
}

module "ec2_ansible_master" {
    source ="./ec2module"
    aws_instance_type = var.aws_instance_type
    aws_ami = var.aws_ami
    instance_name = var.instance_name["ec2-ansible-master"]
    key_name = var.aws_key
    instance_count =  var.ec2_ansible_count["master"]
    publicsubnet  = module.ec2_VPC.public_subnets 
    securitygroups = module.vpc_security_group_ids.securitygrpid

}

module "ec2_ansible_slave" {
    source ="./ec2module"
    aws_instance_type = var.aws_instance_type
    aws_ami = var.aws_ami
    instance_count = var.ec2_ansible_count["slave"]
    instance_name = var.instance_name["ec2-ansible-slave"]
    key_name = var.aws_key
    securitygroups = module.vpc_security_group_ids.securitygrpid
    publicsubnet  = module.ec2_VPC.public_subnets
}




