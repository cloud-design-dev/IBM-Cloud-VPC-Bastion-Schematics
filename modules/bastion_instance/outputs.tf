output "bastion_fip" {
  value = ibm_is_floating_ip.bastion_floatingip.address
}