resource "ibm_is_public_gateway" "public_gateway" {
  name           = "${var.vpc}-${var.name}-pubgw"
  resource_group = data.ibm_resource_group.default.id
  vpc            = var.vpc_id
  zone           = var.zone
  tags           = [var.zone, var.name, var.vpc]
}