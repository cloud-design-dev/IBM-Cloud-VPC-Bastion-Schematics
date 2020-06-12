resource "ibm_is_public_gateway" "bastion_public_gateway" {
  name           = "${var.zone}-bastion-pubgw"
  resource_group = data.ibm_resource_group.default.id
  vpc            = data.ibm_is_vpc.vpc.id
  zone           = var.zone
  tags           = [var.zone, var.vpc_name]
}

resource "ibm_is_subnet" "bastion_subnet" {
  name            = "${var.zone}-${var.vpc_name}-bastion-subnet"
  resource_group  = data.ibm_resource_group.default.id
  vpc             = data.ibm_is_vpc.vpc.id
  zone            = var.zone
  ipv4_cidr_block = "10.240.0.0/28"
  public_gateway  = ibm_is_public_gateway.bastion_public_gateway.id
}

resource "ibm_is_subnet" "private_subnet" {
  name            = "${var.zone}-${var.vpc_name}-private-subnet"
  resource_group  = data.ibm_resource_group.default.id
  vpc             = data.ibm_is_vpc.vpc.id
  zone            = var.zone
  ipv4_cidr_block = "10.240.1.0/24"
  public_gateway  = ibm_is_public_gateway.bastion_public_gateway.id
}