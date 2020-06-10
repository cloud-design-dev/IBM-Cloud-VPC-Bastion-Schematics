module "vpc" {
  source              = "./vpc"
  region              = var.region
  vpc_name            = var.vpc_name
  resource_group_name = var.resource_group_name
}

module "networking" {
  source            = "./networking"
  region            = var.region
  vpc_name          = module.vpc.name
  vpc_id            = module.vpc.vpc_id
  resource_group_id = module.vpc.resource_group_id
}

module "security" {
  source            = "./security"
  region            = var.region
  vpc_name          = module.vpc.name
  vpc_id            = module.vpc.vpc_id
  resource_group_id = module.vpc.resource_group_id
}

# module "bastion_instance" {
#   source       = "./bastion_instance"
#     region              = var.region
#   vpc_name            = var.vpc_name
#   resource_group_name = var.resource_group_name
#   ssh_key_name = var.ssh_key_name
# }

# module "web_instances" {
#   source       = "./web_instances"
#     region              = var.region
#   vpc_name            = var.vpc_name
#   resource_group_name = var.resource_group_name
#   ssh_key_name = var.ssh_key_name
# }
