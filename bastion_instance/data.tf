data "ibm_is_image" "bastion_image" {
  name = var.bastion_image_name
}

data "ibm_is_ssh_key" "ssh_key" {
  name = var.ssh_key_name
}