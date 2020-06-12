module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  resource_group_name = var.resource_group_name
  region              = var.region
}

module "networking" {
  source              = "./modules/networking"
  vpc                 = module.vpc.name
  resource_group_name = var.resource_group_name
  region              = var.region
}

# module "security" {
#   source              = "./modules/security"
#   vpc                 = module.vpc.name
#   region              = module.vpc.region
#   resource_group_name = var.resource_group_name
# }

# module "bastion_instance" {
#   source              = "./modules/instances"
#   vpc                 = module.vpc.name
#   hostname            = var.hostname
#   user_data = file("${path.module}/scripts/bastion.yml")
#   ssh_key_name        = 
#   default_instance_profile = var.default_instance_profile
#   default_subnet_id   = module.networking.bastion_subnet_id
#   bastion_sg_id       = module.security.bastion_sg_id
# }

# module "web_instances" {
#   source              = "./modules/instances"
#   vpc_name            = var.vpc_name
#   vpc_id              = module.vpc.id
#   region              = var.region
#   type                = web
#   resource_group_name = var.resource_group_name
#   ssh_key_name        = var.ssh_key_name
#   private_subnet_id   = module.networking.private_subnet_id
#   private_sg_id       = module.security.private_sg_id
# }

# module "consul_instances" {
#   source              = "./modules/instances"
#   vpc_name            = var.vpc_name
#   vpc_id              = module.vpc.id
#   region              = var.region
#   type                = consul
#   resource_group_name = var.resource_group_name
#   ssh_key_name        = var.ssh_key_name
#   consul_subnet_id    = module.networking.consul_subnet_id
#   private_sg_id       = module.security.private_sg_id
# }

# module "load_balancer" {
#   source              = "./modules/load_balancer"
#   vpc_name            = var.vpc_name
#   consul_count        = module.consul_instances.consul_count
#   region              = var.region
#   resource_group_name = var.resource_group_name
#   consul_subnet_id    = module.networking.consul_subnet_id
#   consul_subnets      = module.consul_instances.consul_instance_ips
# }



# resource "ibm_is_floating_ip" "bastion_floatingip" {
#   name   = "z1-bastion-fip"
#   target = ibm_is_instance.bastion_instance.primary_network_interface[0].id
# }