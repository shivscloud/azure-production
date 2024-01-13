# Output variables
output "all_subnet_id" {
  value = azurerm_subnet.raj-subnet[*].id
}