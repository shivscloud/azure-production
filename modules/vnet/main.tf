resource "azurerm_virtual_network" "devops-vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.address_space]
} 

resource "azurerm_subnet" "raj-subnet" {
  count = length(var.subnet_cidr)
  name  = "${var.vnet_name}-subnet-${count.index + 1}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.devops-vnet.name
  address_prefixes     =  [element(var.subnet_cidr, count.index)]
}

resource "azurerm_network_security_group" "subnet_nsg" {
  count               = length(azurerm_subnet.raj-subnet)
  name                = "${azurerm_subnet.raj-subnet[count.index].name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
   security_rule {
    name                       = "AllowAllInboundTraffic"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

# Associate the NSG with the subnet
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_assoc" {
  count               = length(azurerm_subnet.raj-subnet)
  subnet_id           = azurerm_subnet.raj-subnet[count.index].id
  network_security_group_id = azurerm_network_security_group.subnet_nsg[count.index].id
}