resource "ibm_is_lb" "consul_lb" {
  name           = "${var.vpc_name}-consul-lb"
  subnets        = [var.consul_subnet_id]
  resource_group = data.ibm_resource_group.default.id
  tags           = ["ryantiffany", var.vpc_name]
}


resource "ibm_is_lb_listener" "consul_listener" {
  lb         = ibm_is_lb.consul_lb.id
  port       = "80"
  protocol   = "http"
  depends_on = [ibm_is_lb.consul_lb]
}

resource "ibm_is_lb_pool" "consul_lb_pool" {
  lb                 = ibm_is_lb.consul_lb.id
  name               = "${var.vpc_name}-consul-lb-pool"
  protocol           = "http"
  algorithm          = "round_robin"
  health_delay       = "5"
  health_retries     = "2"
  health_timeout     = "2"
  health_type        = "http"
  health_monitor_url = "/"
  depends_on         = [ibm_is_lb_listener.consul_listener]
}

resource "ibm_is_lb_pool_member" "consul_pool_members_zone1" {
  count          = var.consul_count
  lb             = ibm_is_lb.consul_lb.id
  pool           = ibm_is_lb_pool.consul_lb_pool.id
  port           = "80"
  target_address = "${element(var.consul_subnets[*], count.index)}"
  depends_on     = [ibm_is_lb_pool.consul_lb_pool]
}