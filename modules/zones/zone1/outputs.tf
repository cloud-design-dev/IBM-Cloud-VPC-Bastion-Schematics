output "z1_gateway_id" {
  value = ibm_is_public_gateway.bastion_public_gateway.id
}

output "bastion_subnet_id" {
  value = ibm_is_subnet.bastion_subnet.id
}

output "private_subnet_id" {
  value = ibm_is_subnet.private_subnet.id
}