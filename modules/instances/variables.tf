variable "hostname" {
  type        = string
  description = "Hostname used in fqdn of server"
}

variable "instance_count" {
  description = "Default number of instances to deploy."
  type        = string
  default     = "1"
}

variable "default_instance_profile" {
  type        = string
  description = "Default machine type/size."
  default     = "cx2-2x4"
}

variable "default_instance_image" {
  type        = string
  description = "Default machine image."
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-1"
}

variable "default_subnet_id" {
  type        = string
  description = "Default subnet id for primary interfaces."
  default     = ""
}

variable "default_sg_id" {
  type        = string
  description = "Default security group id for primary interfaces."
  default     = ""
}

variable "vpc" {
  description = "Name of VPC, used as data source"
  default     = ""
}
