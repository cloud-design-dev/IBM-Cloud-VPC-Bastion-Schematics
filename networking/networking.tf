resource "ibm_is_public_gateway" "z1_gateway" {
  name           = "${var.vpc_name}-z1-pubgw"
  resource_group  = var.resource_group_id
  vpc             = var.vpc_id
  zone            = "${var.region}-1"
  tags           = ["ryantiffany", var.region, var.vpc_name]
}

resource "ibm_is_subnet" "vpc_secure_bastion_subnet" {
  name            = "${var.vpc_name}-z1-secure-bastion-subnet"
  resource_group  = var.resource_group_id
  vpc             = var.vpc_id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.240.0.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}

resource "ibm_is_subnet" "vpc_secure_private_subnet" {
  name            = "${var.vpc_name}-z1-secure-private-subnet"
  resource_group  = var.resource_group_id
  vpc             = var.vpc_id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.240.1.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}
