variable "vpc_name" {
  type    = string
  default = ""
}

variable "resource_group_name" {
  type        = string
  description = "Default resource group where resources will be deployed."
  default     = ""
}

variable "zone" {
  type        = string
  description = "Zone where resources will be deployed."
  default     = ""
}