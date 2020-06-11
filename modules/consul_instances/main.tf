resource "ibm_is_instance" "consul" {
  count   = var.instance_count
  name    = "${var.vpc_name}-consul-${count.index + 1}-instance"
  image   = data.ibm_is_image.consul_image_name.id
  profile = var.consul_instance_profile

  primary_network_interface {
    subnet          = var.consul_subnet_id
    security_groups = [var.private_sg_id]
  }

  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.vpc_name]

  vpc       = var.vpc_id
  zone      = "${var.region}-2"
  keys      = [data.ibm_is_ssh_key.ssh_key.id]
  user_data = file("${path.module}/web_install.yml")
}