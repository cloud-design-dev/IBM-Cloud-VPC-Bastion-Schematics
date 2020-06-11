resource "ibm_is_instance" "bastion_instance" {
  name    = "${var.vpc_name}-bastion"
  image   = data.ibm_is_image.bastion_image.id
  profile = var.bastion_instance_profile

  primary_network_interface {
    subnet          = var.bastion_subnet_id
    security_groups = [var.bastion_sg_id]
  }

  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.vpc_name, "bastion"]

  vpc       = var.vpc_id
  zone      = "${var.region}-1"
  keys      = [data.ibm_is_ssh_key.ssh_key.id]
  user_data = file("${path.module}/bastion.yml")
}

resource "ibm_is_floating_ip" "bastion_floatingip" {
  name   = "z1-bastion-fip"
  target = ibm_is_instance.bastion_instance.primary_network_interface[0].id
}