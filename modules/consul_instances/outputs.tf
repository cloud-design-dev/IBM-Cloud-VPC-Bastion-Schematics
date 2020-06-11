output "consul_count" {
  value = var.instance_count
}

output "consul_instance_ips" {
  value = ibm_is_instance.consul[*].primary_network_interface[0].primary_ipv4_address
}