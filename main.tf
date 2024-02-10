# Terraform Block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  
}
# Provider Block
provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "example" {
  name     = "devopsrocks"
  location = "East US"
}
