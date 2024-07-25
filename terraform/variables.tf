variable "resource_group_name" {
  description = "The name of the storage group"
  type = string
}

variable "location" {
  description = "The Azure region to deploy resources to"
  type = string
  default = "East US"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type = string
}

variable "subnet_names" {
  description = "A list of subnet names"
  type = list(string)
}

variable "subnet_prefixes" {
  description = "A list of subnet prefixes"
  type = list(string)
}

variable "nsg_name" {
  description = "The name of the network security group"
  type = string
}

variable "nic_name" {
  description = "The name of the network interface"
  type = string  
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type = string  
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type = string
}

variable "admin_password" {
  description = "The main password for the virtual machine"
  type = string
}

