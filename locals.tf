# Define Local Values in Terraform
locals {
  environment = var.environment
  location            = azurerm_resource_group.devops-rg.location
  resource_group_name = azurerm_resource_group.devops-rg.name
  common_tags = {
    environment = local.environment
  }
} 