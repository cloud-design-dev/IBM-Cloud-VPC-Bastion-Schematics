output "bastion_subnet_id" {
  value = ibm_is_subnet.z1_bastion_subnet.id
}

output "web_private_subnet_id" {
  value = ibm_is_subnet.z1_private_web_subnet.id
}


output "consul_private_subnet_id" {
  value = ibm_is_subnet.z2_private_consul_subnet.id
}
