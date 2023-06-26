resource "azurerm_resource_group" "testRg" {
  name     = var.name
  location = var.location
}