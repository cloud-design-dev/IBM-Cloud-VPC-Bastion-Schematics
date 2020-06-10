variable "vpc_name" {
  description = "Name of the VPC to create."
  type        = string
  default     = ""
}

variable "region" {
  description = "IBM Cloud region to deploy VPC resources. Currently supported regions: eu-de, eu-gb, us-east, us-south. Default is us-south."
  type        = string
  default     = "us-south"
}

variable "resource_group_name" {
  description = "The Resource group that resources will get provisioned in to."
  type        = string
  default     = ""
}

variable "ssh_key_name" {
  description = "Name of SSH key already added to VPC."
  type        = string
  default     = ""
}

variable "bastion_image_name" {
  type        = string
  description = "Default OS image for web hosts."
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-1"

}

variable "bastion_instance_profile" {
  type        = string
  description = "Default machine type/size."
  default     = "cx2-2x4"
}

variable "web_instance_profile" {
  type        = string
  description = "Default machine type/size."
  default     = "cx2-2x4"
}


variable "domain" {
  description = "Domain name for instance. Default is cdetesting.com"
  type        = string
  default     = "cdetesting.com"
}

variable "web_image_name" {
  type        = string
  description = "Default OS image for web hosts."
  default     = "ibm-ubuntu-18-04-1-minimal-amd64-1"
}