variable "vpc" {
  description = "VPC ID to use for deploying resources."
  type        = string
  default     = ""
}

variable "region" {
  description = "IBM Cloud region to deploy VPC resources. Currently supported regions: eu-de, eu-gb, us-east, us-south. Default is us-south."
  type        = string
  default     = "us-south"
}

variable "resource_group" {
  description = "The Resource group ID inherited from toot module."
  type        = string
  default     = ""
}
