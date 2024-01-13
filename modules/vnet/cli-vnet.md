#Its used for to create the resource group of azure (devops-rg)
az group create --name test-rg --location East US

#Cli to create a vnet
Create a Resource Group:

az group create --name production-rg --location "East US"
#Create a Virtual Network:

az network vnet create \
  --resource-group production-rg \
  --name production-vnet \
  --address-prefixes 10.0.0.0/16 \
  --subnet-name web-subnet \
  --subnet-prefix 10.0.1.0/24 \
  --subnet-name app-subnet \
  --subnet-prefix 10.0.2.0/24 \
  --subnet-name db-subnet \
  --subnet-prefix 10.0.3.0/24

#Create Network Security Groups (NSGs):
az network nsg create --resource-group production-rg --name web-nsg --location "East US"
az network nsg create --resource-group production-rg --name app-nsg --location "East US"
az network nsg create --resource-group production-rg --name db-nsg --location "East US"
Associate NSGs with Subnets:
az network vnet subnet update --resource-group production-rg --vnet-name production-vnet --name web-subnet --network-security-group web-nsg
az network vnet subnet update --resource-group production-rg --vnet-name production-vnet --name app-subnet --network-security-group app-nsg
az network vnet subnet update --resource-group production-rg --vnet-name production-vnet --name db-subnet --network-security-group db-nsg

(Optional) Create Gateway Subnet:
az network vnet subnet create --resource-group production-rg --vnet-name production-vnet --name GatewaySubnet --address-prefix 10.0.4.0/24
View VNet Information (Optional):
az network vnet show --resource-group production-rg --name production-v