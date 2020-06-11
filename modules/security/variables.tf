variable "region" {
  description = "IBM Cloud region to deploy VPC resources. Currently supported regions: eu-de, eu-gb, us-east, us-south. Default is us-south."
  type        = string
  default     = "us-south"
}

variable "resource_group_name" {
  description = "The Resource group ID inherited from toot module."
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