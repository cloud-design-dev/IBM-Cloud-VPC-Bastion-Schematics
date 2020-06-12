variable "region" {
  description = "IBM Cloud region to deploy VPC resources. Currently supported regions: eu-de, eu-gb, us-east, us-south. Default is us-south."
  type        = string
  default     = ""
}

variable "resource_group_name" {
  description = "The Resource group ID inherited from toot module."
  type        = string
  default     = ""
}

variable "vpc" {
  description = "Name of VPC. Used in naming resources."
  type        = string
  default     = ""
}