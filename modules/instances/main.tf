resource "ibm_is_instance" "instance" {
  count   = var.instance_count
  name    = "${var.vpc_name}-${var.hostname}-${count.index + 1}"
  image   = data.ibm_is_image.default_image.id
  profile = var.default_instance_profile

  primary_network_interface {
    subnet          = var.default_subnet_id
    security_groups = [var.default_sg_id]
  }

  resource_group = data.ibm_resource_group.default.id
  tags           = [var.vpc_name, var.hostname]

  vpc       = var.vpc_id
  zone      = "${var.region}-1"
  keys      = [data.ibm_is_ssh_key.ssh_key.id]
  user_data = file("${path.module}/install.yml")
}



