variable "zone" {
  type        = string
  description = "Zone where resources will be deployed."
  default     = ""
}

variable "resource_group_name" {
  type        = string
  description = "Default resource group where resources will be deployed."
  default     = ""
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC. This is used in the naming and tagging of resources."
  default     = ""
}

