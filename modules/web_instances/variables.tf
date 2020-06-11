variable "domain" {
  description = "Domain name for instance. Default is cdetesting.com"
  type        = string
  default     = "cdetesting.com"
}


variable "web_instance_profile" {
  type        = string
  description = "Default machine type/size."
  default     = "cx2-2x4"
}

variable "web_image_name" {
  type        = string
  description = "Default OS image for web hosts."
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-1"
}
