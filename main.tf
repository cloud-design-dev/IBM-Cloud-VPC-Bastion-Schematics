module "vpc" {
  source              = "./vpc"
  region              = var.region
  vpc_name            = var.vpc_name
  resource_group_name = var.resource_group_name
}

module "networking" {
  source = "./networking"
}

module "security" {
  source = "./security"
}

module "bastion_instance" {
  source       = "./bastion_instance"
  ssh_key_name = var.ssh_key_name
}

module "web_instances" {
  source       = "./web_instance"
  ssh_key_name = var.ssh_key_name
}
