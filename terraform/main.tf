provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "main" {
  name = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "main" {
  name = var.vnet_name
  address_space = [ "10.0.0.0/16" ]
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

resource "azurerm_subnet" "subnets" {
  count = length(var.subnet_names)
  name = element(var.subnet_names, count.index)
  resource_group_name = azurerm_resource_group.main.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes = [element(var.subnet_prefixes, count.index)]
}

resource "azurerm_network_security_group" "nsg" {
  name = var.nsg_name
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  security_rule {
    name = "allow_ssh"
    priority = 1001
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "main" {
  name = var.nic_name
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name

  ip_configuration {
    name = "internal"
    subnet_id = element(azurerm_subnet.subnets[*].id, 0)
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name = var.vm_name
  location = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  network_interface_ids = [ azurerm_network_interface.main.id ]
  vm_size = "Standard_DS1_v2"

  storage_os_disk {
    name = "osdisk"
    caching = "ReadWrite"
    create_option = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = "Canonical"
    offer = "UbuntuServer"
    sku = "18.04-LTS"
    version = "latest"
  }

  os_profile {
    computer_name = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}