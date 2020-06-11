variable "domain" {
  description = "Domain name for instance. Default is cdetesting.com"
  type        = string
  default     = "cdetesting.com"
}


variable "consul_instance_profile" {
  type        = string
  description = "Default machine type/size."
  default     = "bx2-8x32"
}

variable "consul_image_name" {
  type        = string
  description = "Default OS image for web hosts."
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-1"
}

variable "ssh_key_name" {
  description = ""
  type        = string
  default     = ""
}

variable "region" {
  description = ""
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "Name of Resource Group used as Data source"
  type        = string
  default     = ""
}


variable "vpc_name" {
  description = "VPC Name."
  type        = string
  default     = ""
}

variable "vpc_id" {
  description = "VPC ID."
  type        = string
  default     = ""
}

variable "consul_subnet_id" {}
variable "private_sg_id" {}

variable "instance_count" {
  default = "3"
}