resource "azurerm_subnet" "sohanSubnet" {
  name                 = "SohanSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.SohanNetwork.name
  address_prefixes     = ["10.0.2.0/24"]
  
}