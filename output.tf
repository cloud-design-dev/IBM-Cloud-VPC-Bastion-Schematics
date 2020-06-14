output "vpc_name" {
  value = module.vpc.name
}


output "bastion_floatingip" {
  value = module.zone1.bastion_floatingip
}

output "load_balancer_fqdn" {
  value = module.zone1.load_balancer_fqdn
}

