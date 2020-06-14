output "z1_gateway_id" {
  value = ibm_is_public_gateway.bastion_public_gateway.id
}

output "bastion_subnet_id" {
  value = ibm_is_subnet.bastion_subnet.id
}

output "private_subnet_id" {
  value = ibm_is_subnet.private_subnet.id
}

output "private_instance_ips" {
  value = ibm_is_instance.private_instance[*].primary_network_interface[0].primary_ipv4_address
}

output "bastion_floatingip" {
  value = ibm_is_floating_ip.bastion_floatingip.address

}

output "load_balancer_fqdn" {
  value = ibm_is_lb.private_instance_lb.hostname
}