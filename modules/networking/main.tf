resource "ibm_is_public_gateway" "z1_gateway" {
  name           = "${var.vpc}-z1-pubgw"
  resource_group = data.ibm_resource_group.default.id
  vpc            = data.ibm_is_vpc.vpc.id
  zone           = "${var.region}-1"
  tags           = [var.region, var.vpc]
}

resource "ibm_is_subnet" "z1_bastion_subnet" {
  name            = "${var.vpc}-z1-bastion-subnet"
  resource_group  = data.ibm_resource_group.default.id
  vpc             = data.ibm_is_vpc.vpc.id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.240.0.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}

resource "ibm_is_subnet" "z1_private_web_subnet" {
  name            = "${var.vpc}-z1-private-web-subnet"
  resource_group  = data.ibm_resource_group.default.id
  vpc             = data.ibm_is_vpc.vpc.id
  zone            = "${var.region}-1"
  ipv4_cidr_block = "10.240.1.0/24"
  public_gateway  = ibm_is_public_gateway.z1_gateway.id
}

resource "ibm_is_public_gateway" "z2_gateway" {
  name           = "${var.vpc}-z2-pubgw"
  resource_group = data.ibm_resource_group.default.id
  vpc            = data.ibm_is_vpc.vpc.id
  zone           = "${var.region}-2"
  tags           = [var.region, var.vpc]
}

resource "ibm_is_subnet" "z2_private_consul_subnet" {
  name            = "${var.vpc}-z2-consul-subnet"
  resource_group  = data.ibm_resource_group.default.id
  vpc             = data.ibm_is_vpc.vpc.id
  zone            = "${var.region}-2"
  ipv4_cidr_block = "10.240.64.0/24"
  public_gateway  = ibm_is_public_gateway.z2_gateway.id
}