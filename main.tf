resource "azurerm_resource_group" "devops-rg" {
  name     = "devops-rg"
  location = "East US"
}

module "raj_vnet" {
  source = "./modules/vnet"
  vnet_name = "Devops-vent"
  address_space = "10.0.0.0/16"
  subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24","10.0.3.0/24"]
  location            = local.location
  resource_group_name = local.resource_group_name
}

module "raj_vm" {
  source = "./modules/vm"
  subnet_cidr  = module.raj_vnet.all_subnet_id
  location            = local.location
  resource_group_name = local.resource_group_name
}

output "subnet_value" {
  value = module.raj_vnet.all_subnet_id
}