module "vpc" {
  source              = "./modules/vpc"
  vpc_name            = var.vpc_name
  resource_group_name = var.resource_group_name
  region              = var.region
}

module "zone_1" {
  source              = "./modules/zones/zone1"
  vpc_name            = module.vpc.name
  resource_group_name = var.resource_group_name
  zone                = module.vpc.zone1
  ssh_key             = data.ibm_is_ssh_key.ssh_key.id
}

# module "zone_2" {
#   source              = "./modules/zones/zone2"
#   vpc                 = module.vpc.name
#   resource_group_name = var.resource_group_name
#   zone                = module.vpc.zone2
#   name                = "web"
# }

# module "zone_3" {
#   source              = "./modules/zones/zone3"
#   vpc                 = module.vpc.name
#   resource_group_name = var.resource_group_name
#   zone                = module.vpc.zone3
#   name                = "consul"
# }