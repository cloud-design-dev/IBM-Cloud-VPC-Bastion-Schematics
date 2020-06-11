data "ibm_is_image" "consul_image_name" {
  name = var.consul_image_name
}

data "ibm_resource_group" "default" {
  name = var.resource_group_name
}

data "ibm_is_ssh_key" "ssh_key" {
  name = var.ssh_key_name
}