resource "ibm_is_vpc" "default_rt_vpc" {
  name           = var.vpc_name
  resource_group = var.resource_group
  tags           = ["ryantiffany", var.vpc_name, var.region]
}