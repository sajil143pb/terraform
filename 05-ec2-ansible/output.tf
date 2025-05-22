output "awsip" {
  value = module.ec2_ansible_master.public_ips
}

output "awsip_slave" {
  value = module.ec2_ansible_slave.public_ips
}



