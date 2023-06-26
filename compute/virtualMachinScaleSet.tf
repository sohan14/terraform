resource "azurerm_linux_virtual_machine_scale_set" "sohanVMSS" {
  name                = "Sohanvmss"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Standard_D2s_v3"
  instances           = 1
  admin_username      = "adminuser"
  admin_password = "azure@123449292"
  disable_password_authentication = false

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "ani"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = var.subnet_id
    }
  }
}