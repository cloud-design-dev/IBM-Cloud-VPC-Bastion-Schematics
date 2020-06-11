resource "ibm_is_instance" "web_instances" {
  count   = var.instance_count
  name    = "${var.vpc_name}-web-${count.index + 1}-instance"
  image   = data.ibm_is_image.web_image_name.id
  profile = var.web_instance_profile

  primary_network_interface {
    subnet          = var.private_subnet_id
    security_groups = [var.private_sg_id]
  }

  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.vpc_name]

  vpc       = var.vpc_id
  zone      = "${var.region}-1"
  keys      = [data.ibm_is_ssh_key.ssh_key.id]
  user_data = file("${path.module}/web_install.yml")
}