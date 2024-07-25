output "resource_group_name" {
  description = "The name of the resource group"
  value = azurerm_resource_group.main.name
}

output "virtual_network_name" {
  description = "The name of the virtual network"
  value = azurerm_virtual_network.main.name
}

output "subnet_ids" {
  description = "The IDs of the subnets"
  value = azurerm_subnet.subnets[*].id
}

output "network_security_group_name" {
  description = "The name of the network security group"
 value = azurerm_network_security_group.nsg.name
}

output "network_interface_id" {
  description = "The ID of the network interface"
  value = azurerm_network_interface.main.id
}

output "virtual_machine_id" {
  description = "The ID of the virtual machine"
  value = azurerm_virtual_machine.main.id
}