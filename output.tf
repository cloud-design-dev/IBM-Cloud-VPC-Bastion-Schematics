output "vpc_name" {
  value = module.vpc.name
}

output "bastion_fip" {
  value = module.bastion_instance.bastion_fip
}