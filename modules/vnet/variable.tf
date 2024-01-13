variable "address_space" {
  type        = string
  description = "Cidr range for the Virtual Network"
}

variable "vnet_name" {
  type = string
  description = "We are using this variable for craeting VNET"
}

variable "location" {
  type = string
  description = "It will take the location dynamically"
}

variable "resource_group_name" {
  type = string
  description = "use the azure RG"
}

variable "subnet_cidr" {
  type = list(string)
  description = "subnets cidr"
}