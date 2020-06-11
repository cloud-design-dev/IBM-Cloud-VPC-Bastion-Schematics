module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  resource_group_name = var.resource_group_name
  region              = var.region
}

module "networking" {
  source              = "./modules/networking"
  vpc_name            = var.vpc_name
  vpc_id              = module.vpc.id
  region              = var.region
  resource_group_name = var.resource_group_name
}

module "security" {
  source              = "./modules/security"
  vpc_name            = var.vpc_name
  vpc_id              = module.vpc.id
  region              = var.region
  resource_group_name = var.resource_group_name
}

module "bastion_instance" {
  source              = "./modules/bastion_instance"
  vpc_name            = var.vpc_name
  vpc_id              = module.vpc.id
  region              = var.region
  resource_group_name = var.resource_group_name
  ssh_key_name        = var.ssh_key_name
  bastion_subnet_id   = module.networking.bastion_subnet_id
  bastion_sg_id       = module.security.bastion_sg_id
}

module "web_instances" {
  source              = "./modules/web_instances"
  vpc_name            = var.vpc_name
  vpc_id              = module.vpc.id
  region              = var.region
  resource_group_name = var.resource_group_name
  ssh_key_name        = var.ssh_key_name
  private_subnet_id   = module.networking.private_subnet_id
  private_sg_id       = module.security.private_sg_id
}

module "consul_instances" {
  source              = "./modules/consul_instances"
  vpc_name            = var.vpc_name
  vpc_id              = module.vpc.id
  region              = var.region
  resource_group_name = var.resource_group_name
  ssh_key_name        = var.ssh_key_name
  consul_subnet_id    = module.networking.consul_subnet_id
  private_sg_id       = module.security.private_sg_id
}

