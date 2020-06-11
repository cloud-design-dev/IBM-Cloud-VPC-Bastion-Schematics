module "vpc" {
  source         = "./modules/vpc"
  vpc_name       = var.vpc_name
  resource_group = data.ibm_resource_group.default.id
  region         = var.region
}

module "networking" {
  source         = "./modules/networking"
  resource_group = data.ibm_resource_group.default.id
  vpc            = module.vpc.id
  region         = var.region
}

module "security" {
  source         = "./modules/security"
  resource_group = data.ibm_resource_group.default.id
  vpc            = module.vpc.id
  region         = var.region
  vpc_name       = var.vpc_name
}

# module "bastion_instance" {
#   source            = "./bastion_instance"
#   image             = var.bastion_image_name
#   vpc_name          = var.vpc_name
#   resource_group      = data.ibm_resource_group.default.id
#   ssh_key      = data.ibm_is_key.ssh_key.id
# }

# module "web_instances" {
#   source       = "./web_instances"
#     region              = var.region
#   vpc_name            = var.vpc_name
#   resource_group_name = var.resource_group_name
#   ssh_key_name = var.ssh_key_name
# }
