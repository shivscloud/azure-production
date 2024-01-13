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
  description = "Passing dynamic subnet values"
}
