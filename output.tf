output "vpc_name" {
  value = module.vpc.name
}


# output "bastion_floatingip" {
#   value = module.zone_1.bastion_floatingip
# }

# output "load_balancer_fqdn" {
#   value = module.zone_1.load_balancer_fqdn
# }

output "web_instance_ips" {
  value = module.web_instances.instance_ip
}