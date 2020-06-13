resource "ibm_is_instance" "bastion_instance" {
  depends_on = [ibm_is_subnet.bastion_subnet]
  name       = "${var.vpc_name}-bastion"
  image      = data.ibm_is_image.default.id
  profile    = var.default_instance_profile

  primary_network_interface {
    subnet          = ibm_is_subnet.bastion_subnet.id
    security_groups = [ibm_is_security_group.z1_bastion_sg.id]
  }

  resource_group = data.ibm_resource_group.default.id
  tags           = [var.vpc_name, var.zone]

  vpc       = data.ibm_is_vpc.vpc.id
  zone      = var.zone
  keys      = [var.ssh_key]
  user_data = file("${path.module}/install.yml")
}

resource "ibm_is_instance" "private_instance" {
  count      = var.instance_count
  depends_on = [ibm_is_subnet.private_subnet]
  name       = "${var.vpc_name}-private-${count.index + 1}"
  image      = data.ibm_is_image.default.id
  profile    = var.default_instance_profile

  primary_network_interface {
    subnet          = ibm_is_subnet.private_subnet.id
    security_groups = [ibm_is_security_group.z1_private_sg.id]
  }

  resource_group = data.ibm_resource_group.default.id
  tags           = [var.vpc_name, var.zone]

  vpc       = data.ibm_is_vpc.vpc.id
  zone      = var.zone
  keys      = [var.ssh_key]
  user_data = file("${path.module}/install.yml")
}